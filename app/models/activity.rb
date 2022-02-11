class Activity < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_many :members, through: :registrations, source: :user

  def self.to_csv
    attributes = %w[id name email phone description]
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |team|
        csv << team.attributes.values_at(*attributes)
      end
    end
  end
end
