Spree::Variant.class_eval do
  attr_accessible :discontinued_at

  def discontinued?
    discontinued_at && discontinued_at < DateTime.now
  end
end