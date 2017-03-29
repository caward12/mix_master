require 'rails_helper'

RSpec.feature "User edits a song" do
  scenario "they edit the current song" do
    Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.first.songs.create(title: "No Woman No Crying")
    visit "/songs/'#{Song.first.id}'"
    click_on "Edit"
    fill_in "title", with: "No Woman No Cry"
    click_on "Update Song"

    expect(page).to have_content("No Woman No Cry")
    expect(page).to have_selector(:link_or_button, "Bob Marley")
  end
end