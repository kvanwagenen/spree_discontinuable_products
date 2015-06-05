Spree::Api::ApiHelpers.module_eval do
  mattr_writer :variant_attributes
end
Spree::Api::ApiHelpers.variant_attributes = Spree::Api::ApiHelpers.variant_attributes | [:discontinued_at]