Spree::Product.class_eval do
  def discontinued?
    variants.any? ? variants.select{|v|!v.discontinued?}.any? : master.discontinued?
  end
end