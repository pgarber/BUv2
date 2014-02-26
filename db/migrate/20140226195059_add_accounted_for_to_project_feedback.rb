class AddAccountedForToProjectFeedback < ActiveRecord::Migration
  def change
	 add_column :project_feedbacks, :accounted_for, :datetime

  end
end
