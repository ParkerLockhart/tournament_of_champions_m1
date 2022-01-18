require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'relationships' do
    it { should have_many :competition_teams }
    it { should have_many(:teams).through(:competition_teams) }
    it { should have_many(:players).through(:teams) }
  end

  describe 'instance methods' do
    let!(:competition_1) {Competition.create(name: "Mens Regional", location: "Louisville", sport: "basketball")}
    let!(:competition_2) {Competition.create(name: "Womens State", location: "Deerfield", sport: "powerlifting")}

    let!(:team_1) {competition_1.teams.create(nickname: "Rockets", hometown: "Leesburg")}
    let!(:team_2) {competition_1.teams.create(nickname: "Badgers", hometown: "Springfield")}

    let!(:team_3) {competition_2.teams.create(nickname: "Stars", hometown: "Deerfield")}

    let!(:player_1) {team_1.players.create(name: "Joe", age: 22)}
    let!(:player_2) {team_1.players.create(name: "Rob", age: 21)}
    let!(:player_3) {team_2.players.create(name: "Tim", age: 24)}
    let!(:player_4) {team_2.players.create(name: "Sam", age: 23)}

    let!(:team_4) {competition_1.teams.create(nickname: "Sunshine", hometown: "Philly")}
    let!(:player_5) {team_4.players.create(name: "Taylor", age: 32)}
    let!(:player_6) {team_4.players.create(name: "Jeff", age: 34)}

    describe 'players_avg_age' do
      it 'returns average age for all players in competition' do
        expect(competition_1.players_avg_age.to_i).to eq(26)
      end
    end

    describe 'teams_by_avg_player_age' do
      it 'returns teams and avg player age in order of highest to lowest' do
        expect(competition_1.teams_by_avg_player_age).to eq([team_4, team_2, team_1])
      end
    end
  end
end
