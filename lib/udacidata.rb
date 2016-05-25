require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  	# Your code goes here!
  	@@data_path = File.dirname(__FILE__) + "/../data/data.csv"

	create_finder_methods("brand","name")

  	def self.create(opts = {})
  		add_product = self.new(opts)
  		CSV.open(@@data_path, "a+") do |csv|
    		csv << [add_product.id,add_product.brand,add_product.name,add_product.price]
  		end
  		return add_product
  	end 

  	def self.all
    	products=[]
    	CSV.read(@@data_path, headers:true).each do |product| #read the CSV and iterate over each row
      	#create a new instance of Product and add it to the products array.
      	products << self.new(id: product["id"], brand: product["brand"], name: product["product"], price: product["price"])
    	end
    	#return the array of products.
    	products
  	end

  	def self.first(n=1)
  		if n==1
  			all.first
  		else
  			all.first(n)
  		end
  	end

   	def self.last(n=1)
  		if n==1
  			all.last
  		else
  			all.last(n)
  		end
   	end

   	def self.find(n)
   		prod=nil
      all.each do |product|
        if product.id == n
          prod = product
        end 
      end

      if prod.nil?
        raise ProductNotFoundError, "Product was not found"
      end
      prod
   	end

	def self.destroy(n)
      save_product = find(n)

      if find(n)
        all_data = CSV.table(@@data_path, headers:true)
      	all_data.delete_if do |product|
        	product[:id] == n
      	end
      end

    	File.open(@@data_path, "w") do |f|
        	f.write(all_data.to_csv)
    	end

		return save_product
	end

	def self.where(opts={})
		brand = opts[:brand]
		name = opts[:name]
		new_products = all.select do |product|
			product.name == name || product.brand == brand
		end
	end

	def update(opts={})
    self.brand = opts[:brand] if opts[:brand]
    self.name = opts[:name] if opts[:name]
    self.price = opts[:price] if opts[:price]
    
		all_data = CSV.table(@@data_path, headers:true)
      all_data.each do |product|
        if product[:id] == self.id
          product[:price] = opts[:price] if opts[:price]
        	product[:name] = opts[:name] if opts[:name]
        	product[:brand] = opts[:brand] if opts[:brand]
        end
      end
    File.open(@@data_path, "w") do |f|
      f.write(all_data.to_csv)
    end

    self
	end

end
