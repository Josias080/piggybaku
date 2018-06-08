class Feeling < ApplicationRecord
  belongs_to :user
  monetize :price_cents
  validates :content, presence: true, length: { maximum: 280 }
  validates :price_cents, presence: true, numericality: { less_than: 10000 }
  acts_as_votable
end
 