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
	  good_attributes=Hash.new(0) # default value is zero
	  @ratings = Rating.all
	  @attributes=Attribute.all
	  @ratings.each do |rating|
	    if rating.user_id == target_user_id
	      if @attributes.find_by(id: rating.attribute_id).good
	      	print rating.attribute_id
	        good_attributes[rating.attribute_id] = rating.current_rating
	      end
	    end
	  end
	  good_attributes = good_attributes.sort_by{|_key, value| value}.reverse
	  print "sorted good_attributes: "
	  print good_attributes
	  good_attributes.each do 



	  # good_attributes=Array.new
	  # @ratings = Rating.all
	  # @attributes=Attribute.all
	  # @ratings.each do |rating|
	  #   if rating.user_id == target_user_id
	  #     if @attributes.find_by(id: rating.attribute_id).good
	  #     	print rating.attribute_id
	  #       good_attributes.push({rating.attribute_id => rating.current_rating})
	  #     end
	  #   end
	  # end
	  # good_attributes = good_attributes.sort_by{ |hsh| hsh[:rating]}
	  # print "sorted good_attributes: "
	  # print good_attributes




	end

end
