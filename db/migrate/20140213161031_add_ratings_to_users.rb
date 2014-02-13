class AddRatingsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ratings, :hash
  end
end
