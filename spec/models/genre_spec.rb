require 'spec_helper'

describe Genre do
  it "has many songs" do
    g = build(:genre)
    3.times do |i|
      create(:song, title: "some_song#{i}", genre: g)
    end
    expect(g.songs.count).to eq(3)
  end
end
