class UserSerializer < ActiveModel::Serializer
  attributes :id, :twitter_handle, :name, :bio, :url

  has_many :poems
end
