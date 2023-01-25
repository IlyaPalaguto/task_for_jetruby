class Route < ApplicationRecord
  validates :departure_point, :destination, presence: true
  
  belongs_to :order
  before_save :before_validation_calculate_distance

  private

  def before_validation_calculate_distance
    self.distance = DistanceService.new(starting_point: departure_point, destination: destination).call
  end
end
