require 'spec_helper'

describe Song do
  it "requires a title" do
    song = Song.new
    expect(song.valid?).to eq(false)
    
    #I wouldn't test below this line
    #just testing ActiveRecord::Validations
    expect(song.errors.messages[:title]).to eq(["can't be blank"])
    song.save
    expect(Song.all.count).to eq(0)
    song.title = "I have a title"
    song.save
    expect(Song.all.count).to eq(1)

  end

  it "has a title" do
    song = Song.create(:title => "Walk this Way")
    expect(Song.find_by(:title => "Walk this Way")).to eq(song)
  end

  it "belongs to an artist" do
    artist = Artist.new(:name => "Aerosmith")
    song = Song.new(:title => "Crazy")
    song.artist = artist
    expect(song.artist.name).to eq("Aerosmith")
  end

  it "can assign an artist by name" do
    song = Song.create(:title => "Crazy", :artist_name => "Aerosmith")
    artist = Artist.find_by(:name => "Aerosmith")
    expect(song.artist).to eq(artist)
  end

  it "finds artist if exists by name instead of create" do
    artist = Artist.create(name: "blur")
    expect(Artist.all.count).to eq(1)
    song = Song.create(title: "Song 2", artist_name: "blur")
    expect(song.artist).to eq(artist)
    expect(Artist.all.count).to eq(1)
  end

  it "knows its artist name" do
    song = Song.create(title: "song", artist_name: "artist name")
    expect(song.artist_name).to eq("artist name")
  end

  it "has a genre" do
    song = Song.new(title: "Rap God")
    song.genre = Genre.new(name: "Rap")
    expect(song.genre.name).to eq("Rap")
  end

  it "can assign a genre by name" do
    song = Song.create(:title => "Rap God")
    song.genre_name = "Rap"
    expect(song.genre.name).to eq("Rap")
    song2 = Song.create(title: "2 Legit 2 Quit")
    song2.genre_name = "Rap"
    expect(Genre.all.count).to eq(1)
  end

  it "knows its genre name" do
    song = Song.create(title: "song", genre_name: "genre")
    expect(song.genre_name).to eq("genre")
  end
end
