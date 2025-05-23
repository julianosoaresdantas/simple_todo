# spec/models/waste_entry_spec.rb
require 'rails_helper'

RSpec.describe WasteEntry, type: :model do
  # Test for associations
  it { should belong_to(:user) } # A waste entry belongs to a user

  # Test for validations (assuming waste_type and quantity are required)
  it { should validate_presence_of(:waste_type) }
  it { should validate_presence_of(:quantity) }
  it { should validate_numericality_of(:quantity).is_greater_than(0) } # Assuming quantity must be a positive number

  # A simple test to ensure a waste entry factory is valid
  it 'is valid with valid attributes' do
    waste_entry = FactoryBot.build(:waste_entry) # Uses the :waste_entry factory
    expect(waste_entry).to be_valid
  end
end
