class MoveNumFbReceived < ActiveRecord::Migration
  def change
  	 add_column :ratings, :num_fb_received, :float

  	 remove_column :feedbacks, :num_fb_received
  end
end
