require 'spec_helper'

module Spree
  describe Product do
    context '#discontinued?' do
      subject(:discontinued?){product.discontinued?}
      context 'with a discontinued master variant' do
        let(:product) do 
          product = create(:product)
          product.master.discontinued_at = Time.now - 1.day
          product
        end

        it 'returns true' do
          expect(discontinued?).to eq(true)
        end
      end

      context 'with a not discontinued master variant' do
        let(:product) do 
          product = create(:product)
          product.master.discontinued_at = nil
          product
        end       

        it 'returns false' do
          expect(discontinued?).to eq(false)
        end
      end

      context 'with a single discontinued variant' do
        let(:product) do 
          product = create(:product)
          product.variants = create_list(:variant, 3)
          product.variants.first.discontinued_at = Time.now - 1.day
          product
        end

        it 'returns false' do
          expect(discontinued?).to eq(false)
        end
      end

      context 'with all discontinued variants' do
        let(:product) do 
          product = create(:product)
          product.variants = create_list(:variant, 3, discontinued_at: Time.now - 1.day)
          product
        end

        it 'returns true' do
          expect(discontinued?).to eq(true)
        end
      end
    end
  end
end