class AddDiscontinuedAtToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :discontinued_at, :datetime
  end
end
