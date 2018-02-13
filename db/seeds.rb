=begin
categories=["Delivery","Dine-out","NightLife","Catchingup","Takeaway"]
categories.each do |category|
   Category.create(name: category)
end

cities=["Bangalore","Pune","Hyderabad","Delhi", "Chennai"]
codes=["BLR","PU","HYD","DL","CN"]
cities.each_with_index do |city,index|
   City.create(name: city, city_code: codes[index])
end


cuisines = ["Afghani","American","Biryani","Burger","Grill","Chinese","North Indian","Mughlai", "Rajasthani","Andhra","Seafood","Italian","Salsa"]
cuisines.each do |cuisine|
   Cuisine.create(name:cuisine)
end 

users=["Ani SG","Radha SR","Keerthana DC","Swetha Gopinath","Geetika Chopra","Shan Shaji","Sujith Levaku","Hasan Ali","Indrajith Naiya","Pradeep Gopireddy","Prathap Mohan","Naman Garg"];
users.each do |user|
   User.create(username: user, email: "#{user.split(" ")[0].downcase}@gmail.com", password: "secret123" )
end


locations = ["MG Road","Jayanagar","Kalyani nagar","Wagholi","Banjara hills","Ameerpet","Sunder Nagar","Golf Links","T-Nagar","Nugambakkam"]
cities = ["Bangalore","Pune","Hyderabad","Delhi", "Chennai"]
pointer = 0 
locations.each_with_index do |location,index|
	city_identity = pointer+1 
	response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location.downcase},#{cities[pointer].downcase}&key=AIzaSyBSd0Wq3TJkynnV7JhMgqMLtrTiFU55QEc")
	postal = HTTParty.get("http://postalpincode.in/api/postoffice/#{cities[pointer].downcase}")
    Location.create(name: location, latitude: response.parsed_response["results"][0]["geometry"]["location"]["lat"],longitude: response.parsed_response["results"][0]["geometry"]["location"]["lng"],city_id: city_identity, pincode: postal.parsed_response["PostOffice"][0]["PINCode"])

    if index.odd?
      pointer+=1
    end
end

establishments = ["Quick Bites", "Casual Dinning", "Cafes", "Desert Parlor", "Bakeries", "Beverage Shops", "FoodCourts", "Bars", "Sweet Shops", "Pubs"]
establishments.each do |type|
	Establishment.create(name: type)
end

foodie_levels = ["Foodie", "Big foodie", "Super foodie", "connoisseur", "Rookie"]
User.all.each do |user|
	Profile.create(user_id: user.id, app_handle: user.username.split(" ").first, foodie_level: foodie_levels.sample)
end

#---------------------------------------------------------------
Restaurant.create(name: "Meghana Foods", address: "52, 1st Floor, 33rd Cross, 4th Block, Jayanagar, Bangalore",locality_id: 2, city_id: 1, is_featured: true)

Restaurant.create(name: "Smally's Resto Cafe", address: "1 A, Church Street, Bangalore",locality_id: 1, city_id: 1, is_featured: true)

Restaurant.create(name: "Bubsterr's", address: "Shop 4, Chinar 1 Building, Floriana Estate, East Avenue Road, Kalyani Nagar, Pune",locality_id: 3, city_id: 2, is_featured: true)
Restaurant.create(name: "Green9 Restaurant", address: "Kesnand Road, opposite to Essar Petrol Pump, Wagholi, Pune",locality_id: 4, city_id: 2, is_featured: false)

Restaurant.create(name: "Kaidi Kitchen", address: "286/A, Road 12, Banjara Hills, Hyderabad",locality_id: 5, city_id: 3, is_featured: false)

Restaurant.create(name: "Tipsy Topsy Bakers", address: "Ground Floor, Shree Swathi Anukar Complex, Beside Aditya Trade Centre, Ameerpet, Hyderabad",locality_id: 6, city_id: 3, is_featured: false)

Restaurant.create(name: "Masala House", address: "4, Sunder Nagar, New Delhi",locality_id: 7, city_id: 4, is_featured: true)

Restaurant.create(name: "Soulmate", address: "Golf Course Road, Gurgaon, Delhi",locality_id: 8, city_id: 4, is_featured: false)
Restaurant.create(name: "New Andhra Meals Hotel", address: "102/42, Pondy Bazaar, Sir Thyagaraya Road, T. Nagar, Chennai",locality_id: 9, city_id: 5, is_featured: true)

Restaurant.create(name: "Golden Dragon - Taj Coromandel", address: "Taj Coromandel, 37, Mahatma Gandhi Road, Nungambakkam, Chennai",locality_id: 10, city_id: 5, is_featured: false)

#----------------------------------------------------------


30.times do
	RestaurantCuisine.create(restaurant_id: Random.rand(1..10), cuisine_id: Random.rand(1..13))
end


20.times do 
	Review.create(rating: Random.rand(2..5), restaurant_id: Random.rand(1..10), user_id: Random.rand(1..10), review_body: Faker::Lorem.paragraph)
end
=end







# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
