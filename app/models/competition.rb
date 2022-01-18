class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams
  has_many :players, through: :teams

  def players_avg_age
    players.average(:age)
  end 
end
