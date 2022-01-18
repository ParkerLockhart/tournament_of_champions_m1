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

    let!(:player_1) {team_1.players.create(name: "Joe", age: 22)}
    let!(:player_2) {team_1.players.create(name: "Rob", age: 21)}
    let!(:player_3) {team_2.players.create(name: "Tim", age: 24)}
    let!(:player_4) {team_2.players.create(name: "Sam", age: 23)}
    
    describe 'players_avg_age' do
      it 'returns average age for all players in competition' do
        expect(competition_1.players_avg_age).to eq(22.5)
      end
    end
  end
end
