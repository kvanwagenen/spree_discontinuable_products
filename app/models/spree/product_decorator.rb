Spree::Product.class_eval do
  def discontinued?
    variants.any? ? variants.select{|v|!v.discontinued?}.empty? : master.discontinued?
  end
end