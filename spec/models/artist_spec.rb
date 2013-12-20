require 'spec_helper'

describe Artist do
  #use build instead of create to avoid db hits when possible
  let(:artist) { build(:artist) }
  #build/create come from FactoryGirl

  it "has songs" do
    song = build(:song)
    artist.songs << song
    artist.save
    expect(artist.songs.count).to eq(1)
    expect(artist.songs.first).to eq(song)
  end

  context "with mass-assignment of song titles" do
    let(:song_titles) {["Sowing the Seeds of Love",
        "Everybody Wants to Rule the World"]}

    it "allows adding a collection of song titles" do
      artist.song_names = song_titles
      artist.save
      expect(artist.songs.count).to eq(2)
      expect(artist.songs.map{|s| s.title })
        .to include("Sowing the Seeds of Love")
    end

    it "exposes song names as a propery" do
      artist.song_names = song_titles
      artist.save
      expect(artist.song_names)
      .to include("Sowing the Seeds of Love")
    end
  end

  context "with slugs" do
    let(:artist) {build(:artist, name: "New Order")}
    
    it "has a slugified name on save" do
      artist.save
      expect(artist.slug).to eq("new-order")
    end

    it "uses slug as param" do
      artist.save
      expect(artist.to_param).to eq(artist.slug)
    end

  end

  it "can find artists for a given genre" do
    artist.songs.build(title: "song 1", genre_name: "Rap")
    artist.songs.build(title: "song 2", genre_name: "Rock")
    artist.save
    a = Artist.find_by_genre("Rock").first
    expect(a).to eq(artist)
  end

  it "can find artists that have a record label" do
    artist = create(:artist, name: "Blur", record_label: "Interscope")
    artist2 = create(:artist, name: "Aerosmith", record_label: "Epic")
    artist3 = create(:artist, name: "indie jerks", record_label: nil)
    expect(Artist.with_record_labels.count).to eq(2)
  end

  it "has genres" do
    artist = build(:artist)
    artist.songs.build(title: "song 1", genre_name: "Rap")
    artist.songs.build(title: "song 2", genre_name: "Rock")
    artist.save
    expect(artist.genres.count).to eq(2)
    expect(artist.genres).to include Genre.find_by(name: "Rap")
  end
end
