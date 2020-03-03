class User < ApplicationRecord
  has_secure_password
  enum role: [ :consumer, :practitioner, :manager, :admin ]
  has_many :practices
  has_many :locations, through: :practices
  geocoded_by :coordinates
  after_validation :geocode

  def coordinates
    [latitude, longitude].compact.join(', ')
  end

end
