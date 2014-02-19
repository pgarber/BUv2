# $ bundle exec rake db:reset ??
# $ bundle exec rake db:crunch_ratings   # run with this command
# $ bundle exec rake test:prepare  ??

namespace :db do
  desc "Take data in Feedback and aggregate into User"
  task crunch_ratings: :environment do
    make_ratings

  end
end


def make_ratings
  all_feedback = Feedback.all
  all_feedback.each do |vote|

    if Rating.exists?(user_id: vote.to_id, attribute_identifier: vote.attribute_identifier) # if they've received this attribute before
      @rating = Rating.find_by(user_id: vote.to_id, attribute_identifier: vote.attribute_identifier)

      #puts "have received #{vote.attribute_identifier} before "
      if @rating.current_rating  # todo: this is wierd - fix it.  
      else
        @rating.current_rating = 0
      end
      @rating.current_rating ||= 0
      if vote.updated_at > @rating.updated_at  #feedback is newer than the rating #TODO: is < correct?
        # todo: put more logic here - like less or no impact if same thing comes from same person.  
        # or impact dissipating over time
        # or log scale (try rating = 1 + log(unique votes, base ~1.8) )
        #puts "> "
        @rating.current_rating = @rating.current_rating + 1
        if @rating.save
          print "saved "
        else
          print "saveFAILED"
        end
      end
    else  # this person never got this feedback before, so their score will be 1.
      puts " never received #{vote.attribute_identifier} before "
      Rating.create(user_id: vote.to_id, attribute_identifier: vote.attribute_identifier, current_rating: 1)
    end
  end
end

