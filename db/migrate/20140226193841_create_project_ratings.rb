class CreateProjectRatings < ActiveRecord::Migration
  def change
    create_table :project_ratings do |t|
      t.integer :project_id
      t.integer :project_attribute_identifier
      t.float :current_rating
      t.float :num_fb_received

      t.timestamps
    end
  end
end
