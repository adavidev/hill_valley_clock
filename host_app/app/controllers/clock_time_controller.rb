class ClockTimeController < ApplicationController
  def create
    @employee = Employee.find_by_pin(params[:employee][:pin])
    if @employee
      ClockTime.create(employee_id: @employee.id)
      redirect_to @employee
    else
      flash[:notice] = t "employee.not_found"
      redirect_to root_path
    end
  end
end
