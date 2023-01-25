class Package < ApplicationRecord
  belongs_to :order

  validates :weight, :length, :width, :height, presence: true

  before_save :before_validation_calculate_size

  private

  def before_validation_calculate_size
    self.size = (length * 0.01) * (width * 0.01) * (height * 0.01)
  end
end
