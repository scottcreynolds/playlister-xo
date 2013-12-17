class Artist < ActiveRecord::Base
  has_many :songs

  before_save :sluggify

  def sluggify
    self.slug = self.name.gsub(" ", "-").downcase
  end
  
  def song_names=(names)
    names.each do |title|
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

end
