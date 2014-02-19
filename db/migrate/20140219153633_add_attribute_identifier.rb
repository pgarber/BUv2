class AddAttributeIdentifier < ActiveRecord::Migration
  def change
  	add_column :attributes, :identifier, :integer
  	add_index :attributes, :identifier, unique: true
  	rename_column :feedbacks, :attribute_id, :attribute_identifier
  	rename_column :ratings, :attribute_id, :attribute_identifier

  end
end
