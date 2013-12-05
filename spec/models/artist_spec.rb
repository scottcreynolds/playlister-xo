require 'spec_helper'

describe Artist do
  it "has name and record label" do
    artist = Artist.create(:name => "jethro", :record_label => "test")
    expect(Artist.all.count).to eq(1)
    found = Artist.find_by(:name => "jethro")
    expect(found).to eq(artist)
  end

  it "has songs" do
    artist = Artist.new(name: "Snow")
    song = Song.new(title: "Informer")
    artist.songs << song
    artist.save
    expect(artist.songs.count).to eq(1)
    expect(artist.songs.first).to eq(song)
  end
end
