Given(/^I am on the add songs page$/) do
  visit new_song_path
end

When(/^I add "(.*?)"$/) do |song_name|
  fill_in "Title", with: song_name
  click_on "Create Song"
end

When(/^I add song "(.*?)" with artist "(.*?)"$/) do |song_name, artist_name|
  fill_in "Title", with: song_name
  fill_in "Artist Name", with: artist_name
  click_on "Create Song"
end

Then(/^I should see "(.*?)" by "(.*?)" on the Jukebox page$/) do |song_name, artist_name|
  expect(page).to have_content "#{song_name} - by #{artist_name}"
end


Then(/^I should be on the all songs page$/) do
  expect(current_path).to eq(songs_path)
  expect(page).to have_content("All Songs")
end

Then(/^I should see "(.*?)"$/) do |song_name|
  within("#song_list_partial") do
    expect(page).to have_content(song_name)
  end
end