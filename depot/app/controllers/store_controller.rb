# -*- coding: utf-8 -*-
class StoreController < ApplicationController
    before_filter :find_cart, :except => :empty_cart

  def index
      @products = Product.find_products_for_sale
      if session[:counter].nil?
          session[:counter] = 0
      end
      session[:counter] += 1
  end

    def add_to_cart
        product = Product.find(params[:id])
        @current_item = @cart.add_product(product)
        session[:counter] = 0
        respond_to do |format|
            format.js if request.xhr?
            format.html { redirect_to_index }
        end
    rescue
        logger.error("無効な商品#{params[:id]}にアクセスしようとしました")
        redirect_to_index("無効な商品です")
    end

    def empty_cart
        session[:cart] = nil
        respond_to do |format|
            format.js if request.xhr?
            format.html { redirect_to_index }
        end
    end

    def checkout
        if @cart.items.empty?
            redirect_to_index("カートは現在空です")
        else
            @order = Order.new
        end
    end

    def save_order
        @order = Order.new(params[:order])
        @order.add_line_items_from_cart(@cart)
        if @order.save
            session[:cart] = nil
            redirect_to_index("ご注文ありがとうございます")
        else
            render :action => "checkout"
        end
    end

    private

    def find_cart
        @cart = (session[:cart] ||= Cart.new)
    end

    def redirect_to_index (msg = nil)
        flash[:notice] = msg if msg
        redirect_to :action => "index"
    end

    protected
    def authorize
    end
end
