Spree::Api::ApiHelpers.module_eval do
  alias_method :orig_variant_attributes, :variant_attributes
  def variant_attributes
    orig_variant_attributes | [:discontinued_at]
  end
end