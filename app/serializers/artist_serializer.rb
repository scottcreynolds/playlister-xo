class ArtistSerializer < ActiveModel::Serializer
  attributes :id
  has_many :songs
end
