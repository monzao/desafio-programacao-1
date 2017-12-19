class Merchant < ApplicationRecord
  has_many :items

  validates :name, :address, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
