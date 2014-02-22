module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = {size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end


	def graph_data(target_user_id)
	  print "in graph_data "

	  # format data into an array of arrays for chartkick - get top 5 positive attributes and top 1 negative attribute
	  @show_attributes=Array.new
	  @ratings = Rating.all
	  @attributes=Attribute.all
	  users_good_ratings = Array.new
	  users_bad_ratings = Array.new
	  @ratings.each do |rating|
	  	# TODO: I could use some error checking here because if bad data gets into ratings, can't render home page
	  	# example: if there is a row in the ratings table with an attribute_identifier that's no longer in the 
	  	# attributes table
	  	if rating.user_id == target_user_id  #if the rating is for this user
	      if @attributes.find_by(identifier: rating.attribute_identifier).good == "true"  # and if it's a good rating
	      	users_good_ratings.push(rating)  
	      elsif @attributes.find_by(identifier: rating.attribute_identifier).good == "false" # rating is bad
	      	users_bad_ratings.push(rating)
	      end
	    end
	  end

	  users_good_ratings.sort! { |a,b| b.current_rating <=> a.current_rating } # sort by current rating
	  users_bad_ratings.sort! { |a,b| b.current_rating <=> a.current_rating } # sort by current rating

	  count=1
	  users_good_ratings.each do |rating|
	  	if count <=5
	  	  this_attribute_name = @attributes.find_by(identifier: rating.attribute_identifier).attribute_name
	      @show_attributes.push([this_attribute_name, rating.current_rating])
	      count+=1 
	    end
	  end

	  count =1
	  users_bad_ratings.each do |rating|  # now find the highest rated negative attrib and add to @show_attributes
	  	if count <=1 # only 1 negative attribute
	  	  this_attribute_name = @attributes.find_by(identifier: rating.attribute_identifier).attribute_name
	      @show_attributes.push([this_attribute_name, -1 * rating.current_rating])
	      count+=1 	
	    end
	  end

	  #   original method, working, which only found + attributes
	  # @good_attributes=Array.new
	  # @ratings = Rating.all
	  # @attributes=Attribute.all
	  # users_ratings = Array.new
	  # @ratings.each do |rating|
	  # 	if rating.user_id == target_user_id  #if the rating is for this user
	  #     if @attributes.find_by(id: rating.attribute_id).good == 'true'  # and if it's a good rating
	  #     	users_ratings.push(rating)  
	  #     end
	  #   end
	  # end
	  # users_ratings.sort! { |a,b| b.current_rating <=> a.current_rating } # sort by current rating
	  # count=1
	  # users_ratings.each do |rating|
	  # 	if count <=5
	  # 	  this_attribute_name = @attributes.find_by(id: rating.attribute_id).attribute_name
	  #     @good_attributes.push([this_attribute_name, rating.current_rating])
	  #     count+=1 	
	  #   end
	  # end

	end

	def users_to_graph()
		@show_user_id = Array.new # this array will contain 3 user_id's (in order) to graph
		@ratings = Rating.all
		@users = User.all

		# it would be more explicit to order these by date first, but it's most likely in date order
		#last_user_id = @ratings.pop.user_id
		count = 1  
		@ratings.each do |rating|
		  if count > 3
			return
		  end	 
  		  last_user_id = @ratings.pop.user_id
  		  unless @show_user_id.include?(last_user_id)
			@show_user_id.push(last_user_id)
			count += 1
		  end

		end
	end
end
