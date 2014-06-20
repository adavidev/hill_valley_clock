class EmployeesController < ApplicationController
  respond_to :html

  before_filter :load_employee, except: [:index, :new, :create]

  def load_employee
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
      flash[:notice] = t('employee.successfully_created')
      redirect_to @employee
    else
      flash[:notice] = t('employee.failed_create')
      render action: "new"
    end
  end

  def update
    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end
end
