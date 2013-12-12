require 'spec_helper'

describe Artist do

  let(:artist) {FactoryGirl.create(:artist)}

  it "has name and record label" do
    artist = FactoryGirl.create(:artist)
    expect(Artist.all.count).to eq(1)
    found = Artist.find_by(:name => "Aerosmith")
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

  it "can have a collection of songs added" do
    artist = Artist.new(name: "Tears for Fears")
    song_names = ["Sowing the Seeds of Love",
      "Everybody Wants to Rule the World"]
    artist.song_names = song_names
    artist.save
    expect(artist.songs.count).to eq(2)
    expect(artist.songs.map{|s| s.title })
      .to include("Sowing the Seeds of Love")
  end

  it "knows its song names" do
    artist = Artist.new(name: "Tears for Fears")
    song_names = ["Sowing the Seeds of Love",
      "Everybody Wants to Rule the World"]
    artist.song_names = song_names
    artist.save
    expect(artist.song_names)
    .to include("Sowing the Seeds of Love")
  end

  it "has a slugified name" do
    artist.name = "new order"
    artist.save
    expect(artist.slug).to eq("new-order")
  end
end
