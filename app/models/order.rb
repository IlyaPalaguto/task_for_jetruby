class Order < ApplicationRecord
  include AASM

  belongs_to :user
  has_one :package, dependent: :destroy
  has_one :route, dependent: :destroy

  accepts_nested_attributes_for :route
  accepts_nested_attributes_for :package

  paginates_per 3

  enum status: { received: 0, dispatched: 1, delivered: 2 }

  enum rate: { '1 rubels per km': 1,
               '2 rubels per km': 2,
               '3 rubels per km': 3 }

  aasm column: :status, enum: true do
    state :received, initial: true
    state :dispatched
    state :delivered

    event :confirm, after_commit: :notify_about_status_changed do
      transitions from: :received, to: :dispatched
    end

    event :deliver, after_commit: :notify_about_status_changed do
      transitions from: :dispatched, to: :delivered
    end
  end

  def notify_about_status_changed
    MailerJob.perform_async(self.id)
  end
      
  def calculate_price
    route.skip_callback = true
    package.skip_callback = true
    update(price: route.distance * set_rate)
  end

  def distance
    route.distance
  end
  
  def route_text
    "#{route.departure_point} - #{route.destination}"
  end

  def package_size
    package.size
  end

  private

  def set_rate
    self.rate = if package.size > 1
                  if package.weight < 10
                    2
                  else
                    3
                  end
                else
                  1
                end
  end  
end
