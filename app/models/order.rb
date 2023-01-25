class Order < ApplicationRecord
  belongs_to :user

  has_one :route, dependent: :destroy
  has_one :package, dependent: :destroy
  
  accepts_nested_attributes_for :route
  accepts_nested_attributes_for :package

  paginates_per 3

  enum status: { received: 0, dispatched: 1, delivered: 2 }

  enum rate: { '1 rubels per km': 1,
               '2 rubels per km': 2,
               '3 rubels per km': 3 }
      
  def calculate_price
    self.price = route.distance * set_rate
    save
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
