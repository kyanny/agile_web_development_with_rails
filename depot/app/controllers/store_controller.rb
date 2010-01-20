# -*- coding: utf-8 -*-
class StoreController < ApplicationController
  def index
      @products = Product.find_products_for_sale
      if session[:counter].nil?
          session[:counter] = 0
      end
      session[:counter] += 1
  end

    def add_to_cart
        product = Product.find(params[:id])
        @cart = find_cart
        @cart.add_product(product)
        session[:counter] = 0
    rescue
        logger.error("無効な商品#{params[:id]}にアクセスしようとしました")
        redirect_to_index("無効な商品です")
    end

    def empty_cart
        session[:cart] = nil
        redirect_to_index("カートは現在空です")
    end

    private

    def find_cart
        unless session[:cart]
            session[:cart] = Cart.new
        end
        session[:cart]
    end

    def redirect_to_index (msg)
        flash[:notice] = msg
        redirect_to :action => "index"
    end
end
