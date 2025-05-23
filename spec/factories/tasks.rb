# spec/factories/tasks.rb
FactoryBot.define do
  factory :task do
    # Associate with a user (Factory Bot will create one if not provided)
    association :user

    title { Faker::Lorem.sentence(word_count: 3) } # Generates a random sentence for title
    description { Faker::Lorem.paragraph(sentence_count: 2) } # Generates a random paragraph

    # Default status for tasks
    # If you have an enum in Task model like `enum status: { pending: 0, completed: 1 }`
    # use `status { :pending }` or `status { Task.statuses.keys.sample }`
    status { [ "pending", "completed" ].sample } # Randomly assigns a status
  end
end
