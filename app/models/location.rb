class Location < ApplicationRecord
  belongs_to :practice
  geocoded_by :coordinates
  after_validation :geocode

  def coordinates
    [latitude, longitude].compact.join(', ')
  end
end
