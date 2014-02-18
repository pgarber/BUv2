class AddRatingGivenToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :rating_given, :float
  end
end
