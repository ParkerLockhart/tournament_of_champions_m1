require 'rails_helper'

RSpec.describe 'competition show page' do
  let!(:competition_1) {Competition.create(name: "Mens Regional", location: "Louisville", sport: "basketball")}
  let!(:competition_2) {Competition.create(name: "Womens State", location: "Deerfield", sport: "powerlifting")}

  let!(:team_1) {competition_1.teams.create(nickname: "Rockets", hometown: "Leesburg")}
  let!(:team_2) {competition_1.teams.create(nickname: "Badgers", hometown: "Springfield")}

  let!(:team_3) {competition_2.teams.create(nickname: "Stars", hometown: "Deerfield")}

  let!(:player_1) {team_1.players.create(name: "Joe", age: 22)}
  let!(:player_2) {team_1.players.create(name: "Rob", age: 21)}
  let!(:player_3) {team_2.players.create(name: "Tim", age: 24)}
  let!(:player_4) {team_2.players.create(name: "Sam", age: 23)}

  before(:each) do
    visit "/competitions/#{competition_1.id}"
  end

  it 'shows competition info' do
    expect(page).to have_content("Mens Regional")
    expect(page).to have_content("Louisville")
    expect(page).to have_content("basketball")
  end

  it 'shows all teams in competition' do
    within "#team-#{team_1.id}" do
      expect(page).to have_content("Rockets")
      expect(page).to have_content("Leesburg")
    end
    within "#team-#{team_2.id}" do
      expect(page).to have_content("Badgers")
      expect(page).to have_content("Springfield")
    end
    expect(page).to_not have_content("Stars")
    expect(page).to_not have_content("Deerfield")
  end

  it 'shows average age of all players' do
    expect(page).to have_content("Average age of players competing: 22.5")
  end

  it 'links to register a new team' do
    click_link "Register New Team"
    expect(current_path).to eq("/competitions/#{competition_1.id}/teams/new")
  end

end
