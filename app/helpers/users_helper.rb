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

	  # format data into an array of arrays for chartkick
	  @good_attributes=Array.new
	  @ratings = Rating.all
	  @attributes=Attribute.all
	  count = 1
	  @ratings.each do |rating|

	    if rating.user_id == target_user_id  #if the rating is for this user
	      if @attributes.find_by(id: rating.attribute_id).good  # and if it's a good rating
	      	if count <= 5 # only show 5 attributes.  but this needs to be more advanced so that I show the highest rated 5
	      	  this_attribute_name = @attributes.find_by(id: rating.attribute_id).attribute_name
	          @good_attributes.push([this_attribute_name, rating.current_rating])
	          count+=1
	        print " graph_data count: #{count} "
	        end

	      end
	    end
	  end
	  @good_attributes = @good_attributes.sort{ |a,b| b[1] <=> a[1] }
	  print "sorted @good_attributes is #{@good_attributes}"

	  # do it as an array of hashes for Google Charts - never got it working
	  # @good_attributes=Array.new
	  # @ratings = Rating.all
	  # @attributes=Attribute.all
	  # @ratings.each do |rating|
	  #   if rating.user_id == target_user_id
	  #     if @attributes.find_by(id: rating.attribute_id).good
	  #     	print rating.attribute_id
	  #       #good_attributes.push({rating.attribute_id => rating.current_rating})
	  #       @good_attributes.push({:attribute_id => rating.attribute_id, :rating => rating.current_rating})

	  #     end
	  #   end
	  # end
	  # @good_attributes = @good_attributes.sort_by{ |hsh| hsh[:rating]}.reverse # or sort_by(&:rating)


	end

	def users_to_graph()
		@show_user_id = Array.new # this array will contain 3 user_id's (in order) to graph
		@ratings = Rating.all
		@users = User.all

		# it would be more explicit to order these by date first, but it's most likely in date order
		last_user_id = @ratings.pop.user_id
		count = 1  
		while count <= 3 # go until you have 3 users identified to show	
  		  unless @show_user_id.include?(last_user_id)
			@show_user_id.push(last_user_id)
			count += 1
		  end
		  	last_user_id = @ratings.pop.user_id
		end
	end




end
