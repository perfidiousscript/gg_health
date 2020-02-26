class User < ApplicationRecord
  enum role: [ :consumer, :practitioner, :manager, :admin ]
  has_many :practices
  has_many :locations, through: :practices
end
