class ChangeOppositeidName < ActiveRecord::Migration
  def change
  	  	rename_column :attributes, :opposite_id, :opposite_identifier

  end
end
