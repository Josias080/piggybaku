class Feeling < ApplicationRecord
  belongs_to :user
  monetize :price_cents
  validates :content, presence: true, length: { maximum: 280 }
  validates :price_cents, presence: true
  acts_as_votable
end
