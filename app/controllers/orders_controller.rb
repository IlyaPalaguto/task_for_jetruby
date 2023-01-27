class OrdersController < ApplicationController
  def create
    if order(order_params).save
      order.calculate_price 
      MailerJob.perform_async(order.id)
    end
  end

  def index
    order.build_route
    order.build_package
  end

  private

  def orders
    @orders ||= current_user.orders.joins(:route, :package).order(params[:sort]).page params[:page]
  end
  helper_method :orders

  def order(attributes = {})
    @order ||= params[:id] ? Order.find(params[:id]) : current_user.orders.new(attributes)
  end
  helper_method :order

  def order_params
    params.require(:order).permit(package_attributes: [:weight, :length, :width, :height],
                                  route_attributes: [:departure_point, :destination])
  end
end
