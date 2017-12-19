class Purchase < ApplicationRecord
  belongs_to :purchaser
  belongs_to :item
end
