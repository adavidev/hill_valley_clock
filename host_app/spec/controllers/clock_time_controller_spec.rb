require "spec_helper"

describe ClockTimeController do
  describe :create do
    before :each do
      @employee = Employee.create! pin: "foo"
    end
    it "should create a clock time for an employee" do
      ClockTime.should_receive(:create).with({:employee_id=>@employee.id})

      post :create, {employee: {pin: @employee.pin}}
    end

    it "should redirect to root if no employee is found" do
      post :create, {employee: {pin: "bar"}}
      response.should redirect_to root_path
    end
  end
end
