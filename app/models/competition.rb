class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams
  has_many :players, through: :teams

  def players_avg_age
    players.average(:age)
  end

  def teams_by_avg_player_age
    teams.joins(:players)
    .select("teams.*, avg(players.age) as player_age")
    .group("teams.id")
    .order(player_age: :desc)
  end
end
