module ProjectHelper

	def histogram_project_data(target_project_id, target_project_attribute)
	  @proj_hist_data = { "1" => 0, "2" => 0, "3" => 0, "4" => 0, "5" => 0, "6" => 0, "7" => 0, "8" => 0, "9" => 0, "10" => 0}
  	  @proj_hist_has_data = 0 
  	  relevant_data = ProjectFeedback.where(to_project_id: target_project_id, 
	  							project_attribute_identifier: target_project_attribute)
	  relevant_data.each do |feedback|
	  	@proj_hist_data[ feedback.rating_given ] = @proj_hist_data[ feedback.rating_given ].to_i + 1
	  	@proj_hist_has_data = 1  # we have put some data in
	  end
	end


	def projects_to_graph()  # put up to 3 project_id's in @show_project_id
		@show_project_id = Array.new # this array will contain 3 user_id's (in order) to graph
		# puts "current_user.company.name #{current_user.company.name}"
		# puts "current_user.company.id #{current_user.company.id}"

		#colleagues = current_user.company.users  # cool!  
		#There is even a way to just do per last paragraph of Rails recipes, recipe 1.

		# it would be more explicit to order these by date first, but it's most likely in date order
		#last_user_id = @ratings.pop.user_id

		#all_ratings = ProjectRating.all   # this still needs optimization

		#better:
		#company_ratings = ProjectRating.where("current_user.company.id = ?", :project_id...)

		@ratings = Array.new

		#colleague_ids = colleagues.map(&:id)
		company_id = current_user.company.id
		companys_projects = Project.where(company_id: company_id)  # all of this company's projects
		companys_project_ids = companys_projects.map(&:id)		# the project_id of all of this company's projects
		#company_ratings = ProjectRating.where("?.include?(project_id)", companys_project_ids )

		count = 1  
		companys_project_ids.each do |proj_id|
		  if count > 3
			return
		  end	 
  		  last_proj_id = companys_project_ids.pop
  		  unless @show_project_id.include?(last_proj_id)
			@show_project_id.push(last_proj_id)
			count += 1
		  end
		end
	end


	def graph_project_data(target_project_id) # gathers & prepares data in @all_rating_data for kickchart graphing
	  # this is not complete yet
	
	  print "in projectsHelper graph_project_data "

	  # format data into an array of arrays for chartkick 
	  @all_rating_data = Array.new
	  @project_ratings = ProjectRating.where(project_id: target_project_id )
	  @attributes=Attribute.all
	  my_ratings = Array.new
	  @ratings.each do |rating|
	  	# TODO: I could use some error checking here because if bad data gets into ratings, can't render home page
	  	# example: if there is a row in the ratings table with an attribute_identifier that's no longer in the 
	  	# attributes table
	     my_ratings.push(rating)  
	     puts "rating:.project_attribute_identifier #{rating.project_attribute_identifier}"
	  end

	  #users_good_ratings.sort! { |a,b| b.current_rating <=> a.current_rating } # sort by current rating

	  my_ratings.each do |rating|
	  	this_attribute_name = @attributes.find_by(identifier: rating.attribute_identifier).attribute_name
	    @all_rating_data.push([this_attribute_name, rating.current_rating])
	  end
	end

end

