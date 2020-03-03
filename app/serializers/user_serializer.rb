class UserSerializer < ActiveModel::Serializer
  attributes :latitude, :longitude, :first_name, :last_name, :email_address, :role
end
