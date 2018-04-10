class  Api::V1::LocationsController < Api::V1::ApiController
	def index
		@locations = Location.select("id,name,city_id").all
		array = []
		@locations.each do |location|
			array.push(location.attributes.merge({"city_name" => location.city.name}))
		end
		render json:array
	end
end