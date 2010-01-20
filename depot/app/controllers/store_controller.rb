# -*- coding: utf-8 -*-
class StoreController < ApplicationController
  def index
      @products = Product.find_products_for_sale
  end

    def add_to_cart
        product = Product.find(params[:id])
        @cart = find_cart
        @cart.add_product(product)
    rescue
        logger.error("無効な商品#{params[:id]}にアクセスしようとしました")
        flash[:notice] = "無効な商品です"
        redirect_to :action => "index"
    end

    def empty_cart
        session[:cart] = nil
        flash[:notice] = "カートは現在空です"
        redirect_to :action => "index"
    end

    private

    def find_cart
        unless session[:cart]
            session[:cart] = Cart.new
        end
        session[:cart]
    end
end
