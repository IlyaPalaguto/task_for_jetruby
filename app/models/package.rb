class Package < ApplicationRecord
  belongs_to :order
  has_one :route, through: :order, dependent: :destroy

  validates :weight, :length, :width, :height, presence: true

  before_save :before_save_calculate_size, unless: :skip_callback

  attr_accessor :skip_callback

  private

  def before_save_calculate_size
    self.size = length * width * height * 0.01**3
    order.calculate_price if persisted?
  end
end
