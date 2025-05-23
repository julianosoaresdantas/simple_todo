# spec/models/task_spec.rb
require 'rails_helper'

RSpec.describe Task, type: :model do
  # Test for associations
  it { should belong_to(:user) } # A task belongs to a user (this matcher also checks if it's required)

  # Test for validations
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:status) }

  # A simple test to ensure a task factory is valid
  it 'is valid with valid attributes' do
    task = FactoryBot.build(:task)
    expect(task).to be_valid
  end
end
