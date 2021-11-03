class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :frequency, presence: true

  enum status: {active: 0, archived: 1}
  enum frequency: {monthly: 0, yearly: 1}

end
