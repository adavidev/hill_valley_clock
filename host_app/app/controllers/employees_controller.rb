class EmployeesController < ApplicationController
  respond_to :html

  before_filter :find_employee, except: [:index, :new, :create]

  def find_employee
    @employee = Employee.find(params[:id])
  end

  def index
    @employee = Employee.new
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(params[:employee])

    if @employee.save
      ClockTime.create(employee_id: @employee.id)
      flash[:notice] = t('employee.successfully_created')
      redirect_to @employee
    else
      flash[:errors] = @employee.errors.full_messages
      render action: "new"
    end
  end

  def update
      if @employee.update_attributes(params[:employee])
        flash[:notice] = t('employee.successfully_updated')
        redirect_to @employee
      else
        flash[:errors] = @employee.errors.full_messages
        render action: "edit"
      end
  end

  def destroy
    @employee.destroy
    redirect_to employees_url
  end
end
