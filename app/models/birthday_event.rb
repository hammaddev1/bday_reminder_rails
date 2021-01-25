class BirthdayEvent < ApplicationRecord
  validates :date, presence: true
  validates :bday_username, presence: true
  belongs_to :user
end
