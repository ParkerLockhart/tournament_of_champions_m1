class TeamsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    @competition = Competition.find(params[:competition_id])
    team = @competition.teams.create(team_params)
    if team.save
      redirect_to competition_path(@competition)
    else
      redirect_to "/competitions/#{@competition.id}/teams/new"
      flash[:alert] = "Error: unable to register team, please try again"
    end
  end

  def index
    @competition = Competition.find(params[:competition_id])
  end 

private

  def team_params
    params.require(:team).permit(:nickname, :hometown, :competition_id)
  end
end
