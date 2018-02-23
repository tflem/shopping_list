module Web::Controllers::Products
  class Index
    include Web::Action

    expose :products

    def call(params)
      @products = ProductRepository.new.all
    end
  end
end
