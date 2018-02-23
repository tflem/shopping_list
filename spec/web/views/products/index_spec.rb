require_relative '../../../spec_helper'

describe Web::Views::Products::Index do
  let(:exposures) { Hash[products: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/products/index.html.erb') }
  let(:view)      { Web::Views::Products::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #products' do
    view.products.must_equal exposures.fetch(:products)
  end

  describe 'when there are no products' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no products yet.</p>')
    end
  end

  describe 'when there are products' do
    let(:product1)     { Product.new(product_name: 'Christmas Candy', quantity: 7) }
    let(:product2)     { Product.new(product_name: 'Snowblower',      quantity: 1) }
    let(:exposures)    { Hash[products: [product1, product2]] }

    it 'lists them all' do
      rendered.scan(/class="product"/).count.must_equal 2
      rendered.must_include('Christmas Candy')
      rendered.must_include('Snowblower')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no books yet.</p>')
    end
  end
end
