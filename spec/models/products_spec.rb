require 'rails_helper'

describe Product do
  describe "valididations" do

    it "requires a name" do
      product = Product.new(name: "")
      product.valid?
      expect(product.errors).to have_key(:name)
    end

    it "requires a description" do
      product = Product.new(description: "")
      product.valid?
      expect(product.errors).to have_key(:description)
    end

    it "requires a price" do
      product = Product.new(price: nil)
      product.valid?
      expect(product.errors).to have_key(:price)
    end
  end

  describe "#bargain?" do

    it "is true if the product is less expensive than 1000" do
      product = Product.new(price: 500)
      expect(product.bargain?).to eq(true)
    end
  end
end
