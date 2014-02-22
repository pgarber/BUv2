class CreateProjectFeedbacks < ActiveRecord::Migration
  def change
    create_table :project_feedbacks do |t|
      t.integer :from_id
      t.integer :to_project_id
      t.integer :project_attribute_identifier
      t.integer :rating_given

      t.timestamps
    end
  end
end
