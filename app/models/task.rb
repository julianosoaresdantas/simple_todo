# app/models/task.rb
class Task < ApplicationRecord
  belongs_to :user # <--- Remove optional: true here!

  validates :title, presence: true
  validates :status, presence: true
end
