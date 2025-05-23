# spec/models/user_spec.rb
require 'rails_helper' # This loads your Rails environment and RSpec configurations

RSpec.describe User, type: :model do
  # Test for validations using shoulda-matchers
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive } # Devise handles case insensitivity

  # Test for associations
  it { should have_many(:tasks) }
  it { should have_many(:waste_entries) }

  # A simple test to ensure a user factory is valid
  it 'is valid with a valid email and password' do
    user = FactoryBot.build(:user) # Use FactoryBot to build a user
    expect(user).to be_valid
  end
end
