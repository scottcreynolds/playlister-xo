class Song < ActiveRecord::Base
  belongs_to :artist, touch: true
  belongs_to :genre

  validates :title, presence: true

  after_commit :invalidate_cache

  def invalidate_cache
    Rails.cache.clear([:artist, self.artist_id, :songs])
  end

  def name
    self.title
  end

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
