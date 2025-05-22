# app/models/user.rb
class User < ApplicationRecord
  # Devise modules (e.g., :database_authenticatable, :registerable, etc.)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :waste_entries # Add this line
  # Optional: Add dependent: :destroy if you want all of a user's waste entries
  # to be deleted automatically if the user account is deleted.
  # has_many :waste_entries, dependent: :destroy
end
