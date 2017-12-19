class Item < ApplicationRecord
  belongs_to :merchant

  validates :description, presence: true
  validates :price, presence: true
end
