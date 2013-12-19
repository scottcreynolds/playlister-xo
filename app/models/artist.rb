class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  before_save :sluggify

  def sluggify
    self.slug = self.name.gsub(" ", "-").downcase
  end
  
  def song_names=(song_namess)
    song_namess.each do |title|
      self.songs.build(title: title)
    end
  end

  def song_names
    Rails.cache.fetch([:artist, self.id, :songs]) do
      self.songs.map{|s| s.title }
    end
  end

  def to_param
    self.sluggify unless self.slug
    self.slug
  end

  def self.find(val)
    if val.to_i != 0
      super val
    else
      find_by(:slug => val)
    end
  end

  def self.find_by_genre(genre_name)
    #AREL
    joins(:songs => :genre)
    .where("genres.name ILIKE ?", genre_name)
  end

  def self.with_record_labels
    where.not(:record_label => :nil)
    #where("record_label is not null")
  end

  def self.with_specific_label(label)
    where(record_label: label)
  end

end
