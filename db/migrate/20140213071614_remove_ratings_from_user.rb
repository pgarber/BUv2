class RemoveRatingsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :ratings, :array
  end
end
