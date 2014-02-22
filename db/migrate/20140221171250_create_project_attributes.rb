class CreateProjectAttributes < ActiveRecord::Migration
  def change
    create_table :project_attributes do |t|
      t.integer :identifier
      t.string :project_attribute_name
      t.integer :project_id

      t.timestamps

    end
  end
end
