require 'rails_helper'

describe "Navigating products" do
  it "allows navigation from the detail page to the listing page" do
    product = Product.create(
                        name: "Car",
                        description: "a nice family vehicle",
                        price: 5000
                      )
    visit product_url(product)
    click_link "Back"

    expect(current_path).to eq(products_path)

  end
end
