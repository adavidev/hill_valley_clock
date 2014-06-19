require 'spec_helper'

describe Employee do
  it { should have_many :clock_times }

  describe :update_time do
    it "should add a new clock_time" do
      ClockTime.should_receive(:create)
      Employee.new.update_time
    end
  end
end
