class OrdersController < ApplicationController
  def index
    
  end

  def create
    order(order_params).save
  end

  def show
    
  end

  private

  def orders
    @orders ||= Order.all
  end
  helper_method :orders

  def order(attributes = {})
    @order ||= params[:id] ? Order.find(params[:id]) : Order.new(attributes)
  end
  helper_method :order

  def order_params
    params.require(:order).permit(:weight, 
                                  :length,
                                  :width,
                                  :height,
                                  :departure_point,
                                  :destination)
  end
end
