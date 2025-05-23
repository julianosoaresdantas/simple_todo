# app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # --- Make sure these two lines are present and uncommented! ---
  has_many :tasks # <--- Add/ensure this line is here
  has_many :waste_entries # <--- This one should already be here
  # Optional: If you want tasks/waste entries deleted when user is deleted:
  # has_many :tasks, dependent: :destroy
  # has_many :waste_entries, dependent: :destroy
end
