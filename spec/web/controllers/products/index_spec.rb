require_relative '../../../spec_helper'

describe Web::Controllers::Products::Index do
  let(:action) { Web::Controllers::Products::Index.new }
  let(:params) { Hash[] }
  let(:repository) { ProductRepository.new }

  before do
    repository.clear

    @product = repository.create(product_name: "Socks", quantity: 1)
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all products' do
    action.call(params)
    action.exposures[:products].must_equal [@product]
  end
end
