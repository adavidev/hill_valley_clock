class ClockTimeController < ApplicationController
  def create
    ClockTime.create(params[:employee_id])
    redirect_to root_path
  end
end
