require "spec_helper"

describe ClockTimeController do
  describe :create do
    it "should create a clock time for an employee" do
      ClockTime.should_receive(:create).with("123")

      post :create, {employee_id: "123"}
    end
  end
end
