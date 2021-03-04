class Barbecue < ApplicationRecord
  belongs_to :user
  has_many :users
  has_one_attached :photo
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
end
