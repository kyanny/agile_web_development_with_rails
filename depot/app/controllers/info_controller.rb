class InfoController < ApplicationController
  def who_bought
      @product = Product.find(params[:id])
      @orders = @product.orders
      respond_to do |format|
            format.html
            #format.xml { render :layout => false } # ... xml.builder
            #format.xml { render :layout => false, :xml => @product.to_xml(:include => :orders) } # ... to_xml
            format.atom { render :layout => false }
        end
  end

    def authorize
    end
end
