class Route < ApplicationRecord
  has_one :order, dependent: :destroy
  has_one :package, through: :order, dependent: :destroy
  
  validates :departure_point, :destination, presence: true

  before_save :before_save_calculate_distance

  private

  def before_save_calculate_distance
    self.distance = DistanceService.new(starting_point: departure_point, destination: destination).call
    order.calculate_price if persisted?
  end
end
