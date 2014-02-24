module ProjectHelper

	def graph_project_data(target_project_id)
	  print "in graph_data "

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

end
