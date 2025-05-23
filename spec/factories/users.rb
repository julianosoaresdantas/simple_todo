# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email } # Uses Faker to generate unique emails
    password { 'password' }
    password_confirmation { 'password' }
  end
end
