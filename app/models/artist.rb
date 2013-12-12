class Artist < ActiveRecord::Base
  has_many :songs

  
  
  def song_names=(names)
    names.each do |title|
      self.songs.build(title: title)
    end
  end

  def song_names
    self.songs.map{|s| s.title }
  end
end
