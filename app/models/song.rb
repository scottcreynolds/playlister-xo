class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    self.artist.name unless self.artist.nil?
  end
  
  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(:name => artist_name)
  end
end
