require 'features_helper'

describe 'Add a product' do
  after do
    ProductRepository.new.clear
  end

  it 'can create a new product' do
    visit 'books/new'

    within 'form#product-form' do
      fill_in 'Product_Name', with: 'Popcorn'
      fill_in 'Quantity',     with: 2

      click_button 'Create'
    end

    current_path.must_equal('/products')
    assert page.has_content?('Popcorn')
  end
end
