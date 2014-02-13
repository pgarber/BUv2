class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :attribute_id
      t.float :current_rating

      t.timestamps
    end
  end
end
