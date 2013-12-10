require 'spec_helper'

describe Genre do
  it "has many songs" do
    g = Genre.new(name: "Rap")
    3.times do |i|
      Song.create(title: "some_song#{i}", genre: g)
    end
    expect(g.songs.count).to eq(3)
  end
end
