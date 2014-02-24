module ProjectHelper

	def graph_project_data(target_project_id)
	  # this is not complete yet
	  	
	  print "in projectsHelper graph_data "

	  # format data into an array of arrays for chartkick - get top 5 positive attributes and top 1 negative attribute
	  @show_project_attributes=Array.new
	  @ratings = ProjectRating.all
	  @attributes=ProjectAttribute.all
	  project_good_ratings = Array.new
	  project_bad_ratings = Array.new
	  @ratings.each do |rating|
	    if rating.project_id == target_project_id  #if the rating is for this project
	      project_ratings.push(rating)
	  	end
	  end

	  project_ratings.sort! { |a,b| b.current_rating <=> a.current_rating } # sort by current rating
	  
	  count=1
	  project_ratings.each do |rating|
	  	# if count <=2 # show all the attributes - there's only 2 now
	  	  this_attribute_name = @attributes.find_by(identifier: rating.attribute_identifier).attribute_name
	      @show_project_attributes.push([this_attribute_name, rating.current_rating])
	      count+=1 
	    # end
	  end

	end

	def histogram_project_data(target_project_id, target_project_attribute)

	  @show_project_attributes=Array.new #?? needed?
	  @project_feedbacks = ProjectFeedback.all  # this is such a bad way to do this
	  @attributes = ProjectAttribute.all

	  @proj_hist_data = { "1" => 0, "2" => 0, "3" => 0, "4" => 0, "5" => 0, "6" => 0, "7" => 0, "8" => 0, "9" => 0, "10" => 0, }
	  @project_feedbacks.each do |feedback|
	  	if feedback.to_project_id == target_project_id # if the feedback is for this project
	  	  if feedback.project_attribute_identifier == target_project_attribute.to_i
		  	@proj_hist_data[ feedback.rating_given ] = @proj_hist_data[ feedback.rating_given ].to_i + 1
		  end
	  	end
	  end
	end
end

