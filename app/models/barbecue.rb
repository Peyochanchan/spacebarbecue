class Barbecue < ApplicationRecord
  belongs_to :user
  has_many :users
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
end
