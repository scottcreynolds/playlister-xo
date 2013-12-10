class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  validates :title, presence: true

  def artist_name
    self.artist.name unless self.artist.nil?
  end
  
  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(:name => artist_name)
  end

  def genre_name
    self.genre.name unless self.genre.nil?
  end

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

end
