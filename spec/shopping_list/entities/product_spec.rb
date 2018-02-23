require_relative '../../spec_helper'

describe Product do
  it 'can be initialized with attributes' do
    product = Product.new(product_name: 'Candy Bar')
    product.product_name.must_equal 'Candy Bar'
  end
end
