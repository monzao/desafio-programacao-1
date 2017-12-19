class Purchaser < ApplicationRecord
  has_many :purchases

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
