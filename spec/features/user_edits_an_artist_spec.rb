require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they edit the current artist" do
    Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit "/artists/#{Artist.first.id}"
    click_on "Edit"
    fill_in "artist_name", with: "Bob G. Marley"
    click_on "Update Artist"

    expect(page).to have_content("Bob G. Marley")
    expect(page).to have_css("img[src=\"#{Artist.first.image_path}\"]")
  end
end