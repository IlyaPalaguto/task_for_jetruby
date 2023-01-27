class OrdersMailer < ApplicationMailer
  def created_order(order)
    @user = order.user
    @order = order

    mail to: @user.email, subject: "Order created!"
  end

  def change_status(order)
    @user = order.user
    @order = order

    mail to: @user.email, subject: "Status was changed"
  end
end