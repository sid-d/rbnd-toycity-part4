class Module
  def create_finder_methods(*attributes)
    # Your code goes here!
    # Hint: Remember attr_reader and class_eval
    attributes.each do |att|
    	new_method = %Q{
   			def self.find_by_#{att}(text)
      			Product.all.each do |product|
      				if product.#{att} == text
      					return product
      				end
      			end
   			end
			}
		self.class_eval(new_method)
	end

	# Pass variable into class_eval as an argument
  end
end

