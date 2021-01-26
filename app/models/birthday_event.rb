class BirthdayEvent < ApplicationRecord
  validates :date, presence: true
  validates :bday_username, presence: true
  belongs_to :user

  scope :current_user_events, -> (user_id) {where("user_id = ?", user_id)}
end
