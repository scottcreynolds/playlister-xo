require_relative '../spec_helper'

describe "songs_feature" do
  it "can create songs" do
    visit new_song_path
    fill_in "Title", with: "Simple"
    fill_in "Artist", with: "MC Hammer"
    fill_in "Genre", with: "Rap"
    click_button "Create Song"
    expect(page).to have_content("Song was successfully created.")
    song = Song.find_by(title: "Simple")
    expect(song.artist.name).to eq("MC Hammer")
    expect(song.genre.name).to eq("Rap")
  end  
end
