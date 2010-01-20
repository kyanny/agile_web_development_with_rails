class StoreController < ApplicationController
  def index
      @products = Product.find_products_for_sale
  end

    def add_to_cart
        product = Product.find(params[:id])
        @cart = find_cart
        @cart.add_product(product)
    end

    private

    def find_cart
        unless session[:cart]
            session[:cart] = Cart.new
        end
        session[:cart]
    end
end
