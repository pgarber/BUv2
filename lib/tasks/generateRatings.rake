# $ bundle exec rake db:reset ??
# $ bundle exec rake db:crunch_ratings   # run with this command
# $ bundle exec rake test:prepare  ??

namespace :db do
  desc "Take data in Feedback and aggregate into Ratings"
  task crunch_ratings: :environment do
    make_ratings

  end
end


def make_ratings
  # does this correctly handle ratings? no.  add it.

  new_feedback = Feedback.where(:accounted_for.nil?) # only pull in new feedback
  new_feedback.each do |vote|  
    vote.accounted_for = Time.now
    if vote.save
      print "accounted_for_saved "
    else
      print "accounted_for_saveFAILED " 
    end
    if vote.attribute_identifier < 1000  # it's an attribute, not a rating  
      # todo: not a good way to indicate ratings vs attributes.
      puts "attribute, not rating"
      if Rating.exists?(user_id: vote.to_id, attribute_identifier: vote.attribute_identifier) # if they've received this attribute before
        @rating = Rating.find_by(user_id: vote.to_id, attribute_identifier: vote.attribute_identifier)

        #puts "have received #{vote.attribute_identifier} before "
        unless @rating.current_rating  # is this unless (3 lines) necessary since it's followed by ||=0  ???
          @rating.current_rating = 0
        end
        unless @rating.num_fb_received  
          @rating.num_fb_received = 0
        end
        @rating.current_rating ||= 0

        @rating.current_rating = @rating.current_rating + 1
        @rating.num_fb_received += 1
        if @rating.save
          print "saved "
        else
          print "saveFAILED "
        end 
      else  # this person never got this feedback before, so their score will be 1.
        puts " never received #{vote.attribute_identifier} before "
        Rating.create!(user_id: vote.to_id, attribute_identifier: vote.attribute_identifier, 
                        current_rating: 1, num_fb_received: 1)
      end

      # now, increment and save
    else  # it's a rating, not an attribute
      puts "RATING"
        if Rating.exists?(user_id: vote.to_id, attribute_identifier: vote.attribute_identifier) # if they've received feedback on this rating before
        @rating = Rating.find_by(user_id: vote.to_id, attribute_identifier: vote.attribute_identifier)

        #puts "have received #{vote.attribute_identifier} before "
        unless @rating.current_rating  # is this unless (3 lines) necessary since it's followed by ||=0 - yes it is
          @rating.current_rating = 0
        end
        unless @rating.num_fb_received  
          @rating.num_fb_received = 0
        end
        @rating.current_rating ||= 0  # do these do anything?
        @rating.num_fb_received ||= 0

        @rating.current_rating = (@rating.current_rating * @rating.num_fb_received + vote.rating_given) / (@rating.num_fb_received + 1)
        @rating.num_fb_received += 1
        if @rating.save
          print "saved "
        else
          print "saveFAILED "
        end
      else  # this person never got this feedback before, so their score will be the rating_given.
        puts " never received #{vote.attribute_identifier} before "
        Rating.create!(user_id: vote.to_id, attribute_identifier: vote.attribute_identifier, 
          current_rating: vote.rating_given, num_fb_received: 1)
      end

    end
 
  end  # end of each          

end

