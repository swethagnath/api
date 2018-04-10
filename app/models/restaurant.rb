class Restaurant < ApplicationRecord
	belongs_to :location, foreign_key: 'locality_id'
	belongs_to :city 
	has_many :reviews
end
