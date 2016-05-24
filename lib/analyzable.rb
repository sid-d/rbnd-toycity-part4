module Analyzable
	# Your code goes here!
	def average_price(products)
		total = 0
		products.each do |product|
			total += product.price.to_f
		end
		(total/products.length).round(2)
	end

	def print_report(products)
		"Average Price: #{average_price(products)}\n" +
		count_by_brand(products).to_s+"\n" +
		count_by_name(products).to_s
	end

	def count_by_brand(products)
		counts = Hash.new(0)
		products.each do |product|
			counts[product.brand] += 1
		end
		counts
	end	

	def count_by_name(products)
		counts = Hash.new(0)
		products.each do |product|
			counts[product.name] += 1
		end
		counts
	end

end
