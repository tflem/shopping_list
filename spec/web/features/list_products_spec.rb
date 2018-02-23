require 'features_helper'

describe 'List products' do
  let(:repository) { ProductRepository.new }
  before do
    repository.clear

    repository.create(product_name: 'Milk',  quantity: 2)
    repository.create(product_name: 'Chips', quantity: 4)
  end
  
  it 'displays each product on the page' do
    visit '/products'

    within '#products' do
      assert page.has_css?('.product', count: 2), 'Expected to find 2 products'
    end
  end
end
