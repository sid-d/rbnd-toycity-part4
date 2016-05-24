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
		"a"
	end

	def count_by_brand(products)
		{ "FindMyBrand" => 1 }
	end	

	def count_by_name(products)
		{ "FindMyName" => 1 }
	end

end
