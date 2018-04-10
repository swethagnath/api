class City < ApplicationRecord
	has_many :restaurants
	has_many :locations 
end
