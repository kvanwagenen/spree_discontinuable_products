require 'spec_helper'

module Spree
  describe Variant do
    let(:variant) { create(:variant) }

    context '#discontinued?' do      
      it 'returns true if discounted_at is in the past' do
        variant.discontinued_at = Time.now - 1.day
        expect(variant.discontinued?).to eq(true)
      end

      it 'returns false if discounted_at is in the future' do
        variant.discontinued_at = Time.now + 1.day
        expect(variant.discontinued?).to eq(false)
      end

      it 'returns false if discounted_at is nil' do
        variant.discontinued_at = nil
        expect(variant.discontinued?).to eq(false)
      end
    end
  end
end