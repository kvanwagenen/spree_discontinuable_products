Spree::Variant.class_eval do
  def discontinued?
    discontinued_at && discontinued_at < DateTime.now
  end

  def discontinued_at=(discontinued_at)
    write_attribute(:discontinued_at, discontinued_at)
    after_set_discontinued_at
  end

  def after_set_discontinued_at
    # To be overridden
  end
end