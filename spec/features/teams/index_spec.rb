require 'rails_helper'

RSpec.describe 'teams index page' do
  let!(:competition_1) {Competition.create(name: "Mens Regional", location: "Louisville", sport: "basketball")}
  let!(:competition_2) {Competition.create(name: "Womens State", location: "Deerfield", sport: "powerlifting")}

  let!(:team_1) {competition_1.teams.create(nickname: "Rockets", hometown: "Leesburg")}
  let!(:team_2) {competition_1.teams.create(nickname: "Badgers", hometown: "Springfield")}
  let!(:team_4) {competition_1.teams.create(nickname: "Sunshine", hometown: "Philly")}

  let!(:team_3) {competition_2.teams.create(nickname: "Stars", hometown: "Deerfield")}

  let!(:player_1) {team_1.players.create(name: "Joe", age: 22)}
  let!(:player_2) {team_1.players.create(name: "Rob", age: 21)}
  let!(:player_3) {team_2.players.create(name: "Tim", age: 24)}
  let!(:player_4) {team_2.players.create(name: "Sam", age: 23)}

  before(:each) do
    visit "competition_teams_path(competition_1)"
  end

  it 'shows all teams registered' do
    expect(page).to have_content("Leesburg Rockets")
    expect(page).to have_content("Springfield Badgers")
    expect(page).to have_content("Philly Sunshine")
    expect(page).to_not have_content("Deerfield Stars")
  end

  it 'shows players average age for each team' do
    within "#team-#{team_1.id}" do
      expect(page).to have_content()
    end
    within "#team-#{team_2.id}" do
      expect(page).to have_content()
    end
    within "#team-#{team_4.id}" do
      expect(page).to have_content()
    end
  end

  it 'shows teams in order of average player age, high to low' do
    expect().to appear_before()
    expect().to appear_before()
    expect().to appear_before()
  end
end 
