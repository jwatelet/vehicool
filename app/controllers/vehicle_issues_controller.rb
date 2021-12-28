# frozen_string_literal: true

class VehicleIssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vehicle, only: %i[create]

  def create
    @issue = @vehicle.issues.create!(issue_params)
    redirect_to(vehicle_path(@vehicle.id))
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def issue_params
    params.require(:issue).permit(:kilometer, :is_open, :text)
  end
end
