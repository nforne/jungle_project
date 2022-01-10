class ProductsController < ApplicationController

  def index
    @@enhanced_order.clear
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
