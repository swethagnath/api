class Api::V1::RestaurantsController < Api::V1::ApiController
	def show 
		@restaurant = Restaurant.select(:id,:name,:city_id,:locality_id).find(params[:id])
	    array = @restaurant.attributes.merge(
	    	{"location_name"=> @restaurant.location.name,
	    	  "city_name" =>  @restaurant.city.name,
	    	  "reviews_count" => @restaurant.reviews.count,
	    	  "reviews" => []
	    	})	    
	     @restaurant.reviews.each do |review|	
	     	array["reviews"].push(@restaurant.attributes.extract!("id").merge(review.user.profile.attributes.extract!("user_id", "app_handle", "foodie_level")))
	     end     
		render json: array 
	end
end