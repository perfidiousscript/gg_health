class User < ApplicationRecord
  enum role: [ :consumer, :practitioner, :manager, :admin ]
end
