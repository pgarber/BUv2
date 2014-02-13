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

    if Rating.exists?(user_id: vote.to_id, attribute_id: vote.attribute_id)
      @rating = Rating.find_by(user_id: vote.to_id, attribute_id: vote.attribute_id)
        # @ratings = @ratings_user.where(attribute_id: vote.attribute_id)

      if @rating.current_rating
      else
        @rating.current_rating = 0
      end
      @rating.current_rating ||= 0
      if vote.updated_at > @rating.updated_at  #feedback is newer than the rating
        @rating.current_rating = @rating.current_rating + 1
        if @rating.save
          print "saved"
        else
          print "saveFAILED"
        end
      end
    else  # this person never got this feedback before, so their score will be 1.
      Rating.create(user_id: vote.to_id, attribute_id: vote.attribute_id, current_rating: 1)
    end
  end
end

