class Location < ApplicationRecord
  belongs_to :user
  belongs_to :barbecue
  validates :status, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :user, uniqueness: { scope: :barbecue }
end

#  presence: true, inclusion: { in: %i[accepted declined canceled pending] }
