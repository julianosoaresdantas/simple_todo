# app/models/waste_entry.rb
class WasteEntry < ApplicationRecord
  belongs_to :user # A waste entry belongs to a user, and it's required by default in Rails

  validates :waste_type, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 } # Quantity must be present and a positive number
end
