class Task < ApplicationRecord
  validates :title, presence: true
  validate :due_date_cannot_be_in_the_past, on: :create # This line calls the custom method

  private

  def due_date_cannot_be_in_the_past
    # Only run this validation if a due_date is actually set
    if due_date.present? && due_date < Date.current
      errors.add(:due_date, "can't be in the past")
    end
  end
end
