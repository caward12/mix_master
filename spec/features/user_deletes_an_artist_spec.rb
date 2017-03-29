require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they delete the current artist" do
    Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit "/artists/#{Artist.first.id}"
    click_on "Delete"
    expect(current_path).to eq(artists_path)

    expect(page).to_not have_content("Bob Marley")
  end
end