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

  def is_practitioner?
    role == "pracitioner"
  end

  def is_manager?
    role == "manager"
  end

  def is_admin?
    role == "admin"
  end

end
