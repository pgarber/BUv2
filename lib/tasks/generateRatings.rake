# $ bundle exec rake db:reset ??
# $ bundle exec rake db:crunch_ratings
# $ bundle exec rake test:prepare  ??

namespace :db do
  desc "Take data in Feedback and aggregate into User"
  task crunch_ratings: :environment do
    make_ratings

  end
end


def make_ratings
  puts "start of make_ratings"
  all_feedback = Feedback.all
  all_feedback.each do |vote|

    if Rating.exists?(user_id: vote.to_id, attribute_id: vote.attribute_id)
      # puts "rating exists "
      # @ratings_user = Rating.where(user_id: vote.to_id)
      @rating = Rating.find_by(user_id: vote.to_id, attribute_id: vote.attribute_id)
        # @ratings = @ratings_user.where(attribute_id: vote.attribute_id)
      # print "@rating_user user_id: "
      # puts @rating.user_id
      # print "@rating.current_rating"
      if @rating.current_rating
        # print "@rating.current_rating exists"
      else
        # print "didn't exist "
        @rating.current_rating = 0
      end
      # puts "here 0 "

      @rating.current_rating ||= 0
      # puts "here1 "
      @rating.current_rating = @rating.current_rating + 1
      # puts "here2 "
      # print "new rating: "
      # puts @rating.current_rating
      if @rating.save
        print "saved"
      else
        print "saveFAILED"
      end

    else
      puts "nope "
      Rating.create(user_id: vote.to_id, attribute_id: vote.attribute_id, current_rating: 1)
    end
  end




   #   if @user.save!   # user.save! and look for errors 
   #    print "saved " 
   #   else 
   #    print "didn't save" 
   #   end      
   #  # User.find(vote.to_id).ratings[vote.attribute_id]+=1 
   # end   	



end

