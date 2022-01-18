require 'rails_helper'

RSpec.describe 'competitions index page' do
  let!(:competition_1) {Competition.create(name: "Mens Regional", location: "Louisville", sport: "basketball")}
  let!(:competition_2) {Competition.create(name: "Womens State", location: "Deerfield", sport: "powerlifting")}

  before(:each) do
    visit '/competitions'
  end

  it 'shows the name of each competition' do
    expect(page).to have_content("Mens Regional")
    expect(page).to have_content("Womens State")
  end

  it 'links to competition show page' do
    within "#competition-#{competition_1.id}" do
      click_link("Mens Regional")
      expect(current_path).to eq("/competitions/#{competition_1.id}")
    end
  end

  it 'links to competition show page' do
    within "#competition-#{competition_2.id}" do
      click_link("Womens State")
      expect(current_path).to eq("/competitions/#{competition_2.id}")
    end
  end
end
