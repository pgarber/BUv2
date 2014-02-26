class AddNumFbReceived < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :num_fb_received, :float  	
  end
end
