class Order < ApplicationRecord
  validates :weight, :length, :width, :height, :departure_point, :destination, presence: true
  before_save :before_save_calculate_price

  belongs_to :user

  paginates_per 3

  private

  def before_save_calculate_price
    calculate_distance
    self.price = distance * set_rate
  end
  
  def calculate_distance
    self.distance = DistanceService.new(starting_point: departure_point, destination: destination).call
  end

  def set_rate
    if calculate_size > 1
      if weight < 10
        self.rate = '2 rubles per km'
        2
      else
        self.rate = '3 rubles per km'
        3
      end
    else
      self.rate = '1 ruble per km'
      1
    end
  end
  
  def calculate_size
    self.size = (length * 0.01) * (width * 0.01) * (height * 0.01)
  end
end
