require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see a list of all artists"do
    Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create(name: "Ziggy Marley", image_path: "https://a2-images.myspacecdn.com/images03/33/3a9988c37b5e45f985134cf2d41670dc/300x300.jpg")

    visit artists_path

    expect(page).to have_content Artist.first.name
    expect(page).to have_link Artist.first.name
  end
end