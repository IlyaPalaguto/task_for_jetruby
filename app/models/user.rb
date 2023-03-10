class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  has_many :orders, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
end
