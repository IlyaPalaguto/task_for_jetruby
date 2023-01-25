class Package < ApplicationRecord
  has_one :order

  validates :weight, :length, :width, :height, presence: true

  before_save :before_save_calculate_size

  private

  def before_save_calculate_size
    self.size = (length * 0.01) * (width * 0.01) * (height * 0.01)
  end
end
