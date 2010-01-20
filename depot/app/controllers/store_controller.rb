class StoreController < ApplicationController
  def index
      @products = Product.find_products_for_sale
  end

    private

    def find_cart
        unless session[:cart]
            session[:cart] = Cart.new
        end
        session[:cart]
    end
end
