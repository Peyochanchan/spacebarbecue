class Location < ApplicationRecord
  belongs_to :user
  belongs_to :barbecue
  validates :status, presence: true, inclusion: { in: %i[accepted declined canceled pending] }
  validates :user, uniqueness: { scope: :barbecue }
end
