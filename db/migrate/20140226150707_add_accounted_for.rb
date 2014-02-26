class AddAccountedFor < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :accounted_for, :datetime
  end
end
