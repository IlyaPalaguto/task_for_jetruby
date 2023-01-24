class OrdersController < ApplicationController
  def create
    order(order_params).save
  end

  def index

  end

  private

  def orders
    @orders ||= current_user.orders.order(params[:sort]).page params[:page]
  end
  helper_method :orders

  def order(attributes = {})
    @order ||= params[:id] ? Order.find(params[:id]) : current_user.orders.new(attributes)
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
