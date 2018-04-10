class Api::V1::ReviewsController <  Api::V1::ApiController
	def index
		@restaurant = Restaurant.find_by(id:params[:restaurant_id])
		y = []
		@restaurant.reviews.each do |review|
			# y.push(review.attributes.extract!("user_id").merge(review.user.profile.attributes.extract!("app_handle","foodie_level")).merge({"id" => @restaurant.id}))
			y.push({"id" => @restaurant.id}.merge(review.attributes.extract!("user_id")).merge(review.user.profile.attributes.extract!("app_handle","foodie_level")))
		end
		render json:y
	end
end