class Route < ApplicationRecord
  belongs_to :order
  has_one :package, through: :order, dependent: :destroy
  
  validates :departure_point, :destination, presence: true

  before_validation :before_validation_calculate_distance, unless: :skip_callback

  attr_accessor :skip_callback

  private

  def before_validation_calculate_distance
    self.distance = DistanceService.new(starting_point: departure_point, destination: destination).call
    order.calculate_price if persisted?
  rescue => e
    errors.add(:route, e.message)
  end
end
