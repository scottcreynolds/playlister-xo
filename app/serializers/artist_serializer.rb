class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :record_label, :song_names, :this_other_thing

  def this_other_thing
    "i don't know something"
  end
end
