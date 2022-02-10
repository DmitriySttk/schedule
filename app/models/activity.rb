class Activity < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_many :members, through: :registrations, source: :user
end
