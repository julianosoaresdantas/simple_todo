# spec/factories/waste_entries.rb
FactoryBot.define do
  factory :waste_entry do
    # Associate with a user
    association :user

    waste_type { Faker::Food.ingredient } # Generates a random food ingredient as waste type
    quantity { Faker::Number.between(from: 1, to: 100) } # Random quantity between 1 and 100
    unit { [ "kg", "g", "liter", "items" ].sample } # Random unit
    entry_date { Faker::Date.between(from: 1.year.ago, to: Date.today) } # Random date within the last year
  end
end
