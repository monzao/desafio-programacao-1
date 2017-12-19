class Item < ApplicationRecord
  belongs_to :merchant

  validates :description, :price, presence: true
end
