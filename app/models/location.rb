class Location < ApplicationRecord
  belongs_to :practice
  geocoded_by :coordinates
  after_validation :geocode

  # Services JSONB xould look something like this:
  # With primary service (if applicable) then
  # 'sub services' represented in hashes
  # {
  #  "primary_service": "massage",
  #  "massage":   [
  #              "standard",
  #              "deep_tissue",
  #              "shiatsu"
  #             ]
  #  "reiki":   [
  #              "standard"
  #              ]
  # }

  def coordinates
    [latitude, longitude].compact.join(', ')
  end
end
