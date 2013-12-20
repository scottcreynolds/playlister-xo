require 'spec_helper'

describe Song do
  it "requires a title" do
    song = Song.new
    expect(song.valid?).to eq(false)
    # I wouldn't test below this line because
    # that' just testing ActiveRecord::Validations
    # which is already well-tested, but this is how
    # we know for sure it works
    expect(song.errors.messages[:title]).to eq(["can't be blank"])
    song.save
    expect(Song.all.count).to eq(0)
    song.title = "I have a title"
    song.save
    expect(Song.all.count).to eq(1)
  end

  it "belongs to an artist" do
    artist = build(:artist)
    song = build(:song, title: "Crazy", artist: artist)
    expect(song.artist.name).to eq("Aerosmith")
  end

  it "can assign an artist by name with find or create" do
    song = build(:song, artist_name: "Aerosmith")
    expect(song.artist.name).to eq("Aerosmith")
    song2 = build(:song, artist_name: "Aerosmith")
    expect(Artist.all.count).to eq(1)
  end

  it "exposes artist name as a property" do
    song = build(:song, artist_name: "artist name")
    expect(song.artist_name).to eq("artist name")
  end

  it "has a genre" do
    genre = build(:genre)
    song = build(:song, genre: genre)
    expect(song.genre.name).to eq(genre.name)
  end

  it "assigns genre by name with find or create" do
    song = build(:song, genre_name: "Rap")
    expect(song.genre.name).to eq("Rap")
    song2 = build(:song, genre_name: "Rap")
    expect(Genre.all.count).to eq(1)
  end

  it "exposes genre name directly" do
    song = build(:song, genre_name: "genre")
    expect(song.genre_name).to eq("genre")
  end
end
