class CartsController < ApplicationController
  
  def show
    @@enhanced_order.clear
  end

  def add_item
    if logged_in?
      product_id = params[:product_id].to_s
      modify_cart_delta(product_id, +1)
      redirect_to :back
    else
      flash[:notice] = "Create an account (Sign-Up) or Login to add items to your cart. Thank you and happy shopping!"
      redirect_to :back
    end
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)

    redirect_to :back
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

end
