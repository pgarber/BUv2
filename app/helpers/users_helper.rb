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
	  @ratings.each do |rating|
	    if rating.user_id == target_user_id
	      if @attributes.find_by(id: rating.attribute_id).good
	      	#print rating.attribute_id
	      	this_attribute_name = @attributes.find_by(id: rating.attribute_id).attribute_name
	      	puts "this_attribute_name"
	      	puts this_attribute_name
	        @good_attributes.push([this_attribute_name, rating.current_rating])
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

end
