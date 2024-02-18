class AstronautMissionsController < ApplicationController

  def create
    AstronautMission.create!(astronaut_id: params[:id], mission_id: params[:Mission_Id])

    redirect_to "/astronauts/#{params[:id]}"
  end
end