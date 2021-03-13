class Review < ApplicationRecord
  belongs_to :barbecue
  belongs_to :user
  validates :content, length: { minimum: 20 }
end
