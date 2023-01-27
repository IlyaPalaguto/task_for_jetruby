class MailerJob
  include Sidekiq::Job

  def perform(arg)
    order = Order.find(arg)
    if order.received?
      OrdersMailer.created_order(order).deliver_now
    else
      OrdersMailer.change_status(order).deliver_now
    end
  end
end
