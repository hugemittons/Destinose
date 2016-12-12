class Recommendation < ApplicationRecord
  belongs_to :user
  has_many :swipes, dependent: :destroy
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.address = geo.address
      obj.country = geo.country
    end
  end
  after_validation :reverse_geocode, :fetch_address
  validates :user, presence: :true
end
