class FeedbacksController < ApplicationController
  before_action :signed_in_user

  def create #make this work for feedbacks - it came from relationships controller 
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def new
  	@relationship = Relationship.new
  end

  def complete

    puts ":id is "
    puts :id
    puts "params[:id] is "
    puts params[:id]
    @attribute=Attribute.all
    @user = User.find(params[:id])
    params[:attribute_checkbox].each do |check|

       attribute_id = check

      #t = Feedback.find_by_id(attribute_id) # don't need this since I'm always creating new

      Feedback.create(from_id: current_user.id, to_id: @user.id, 
                  attribute_id: attribute_id);

     end
    flash[:success] = "Feedback saved.  Feedback will show up after midnight EST tonight"
    redirect_to root_url  # TODO - don't go home.  stay on the page.  use ajax?
  end

  def slider_complete

    puts ":id is "
    puts :id
    puts "params[:id] is "
    puts params[:id]
    @attribute=Attribute.all
    @user = User.find(params[:id])
    params[:attribute_checkbox].each do |check|

       attribute_id = check
          #t = Feedback.find_by_id(attribute_id) # don't need this since I'm always creating new
          Feedback.create(from_id: current_user.id, to_id: @user.id, 
                      attribute_id: attribute_id, rating_given: rating_given);
       
     end
    flash[:success] = "Feedback saved.  Feedback will show up after midnight EST tonight"
    redirect_to root_url  # TODO - don't go home.  stay on the page.  use ajax?
  end

end

