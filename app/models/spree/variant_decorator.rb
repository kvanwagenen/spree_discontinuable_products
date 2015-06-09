Spree::Variant.class_eval do
  def discontinued?
    discontinued_at && discontinued_at < DateTime.now
  end
end