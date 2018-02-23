require "features_helper"

describe "List products" do
  it "displays each product on the page" do
    visit "/products"

    within "#products" do
      assert page.has_css?(".product", count: 2), "Expected to find 2 products"
    end
  end
end
