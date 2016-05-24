require 'faker'

# This file contains code that populates the database with
# fake data for testing purposes

def db_seed
	prices = ["2.13", "14.52", "2.16", "99.99", "19.99"] 

	10.times do
  # you will write the "create" method as part of your project
  		Product.create( brand: Faker::Company.name, 
                  name: Faker::Commerce.product_name, 
                  price: prices.sample )
	end
end
