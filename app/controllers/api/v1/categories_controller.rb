class Api::V1::CategoriesController < Api::V1::ApiController
	def index
		@categories =  Category.select("id,name").all
		render json
	end
end