require 'rails_helper'

RSpec.feature "User views all songs for artist" do
  scenario "they see a list of all songs for that artist"do
    Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.first.songs.create(title: "One Love")
    Artist.first.songs.create(title: "No Woman, No Cry")
    Artist.first.songs.create(title: "Redemption Song")
    visit artist_songs_path(Artist.first.id)

    expect(page.find('li:nth-child(1)')).to have_content "No Woman, No Cry"
    expect(page.find('li:nth-child(2)')).to have_content "One Love"
    expect(page.find('li:nth-child(3)')).to have_content "Redemption Song"
  end
end