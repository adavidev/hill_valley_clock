require 'spec_helper'

describe ClockTime do
  it { should belong_to :employee }

  describe :set_clockin_status do
    it "should show clocked in if the last clock time is nil" do
      ct = ClockTime.create!
      ct.clockin.should == true
    end

    it "should create clockin bools with the opposite of what was done last" do
      ct = ClockTime.create!
      ct2 = ClockTime.create!
      ct3 = ClockTime.create!
      ct.clockin.should == true
      ct2.clockin.should == false
      ct3.clockin.should == true
    end

    it "should not be affected by clockins of other employees" do
      em1 = Employee.create!(pin: "a")
      em2 = Employee.create!(pin: "b")
      ct = ClockTime.create!(employee_id:em1.id)
      ct2 = ClockTime.create!(employee_id:em2.id)
      ct3 = ClockTime.create!(employee_id:em1.id)
      ct4 = ClockTime.create!(employee_id:em2.id)
      ct5 = ClockTime.create!(employee_id:em1.id)
      ct6 = ClockTime.create!(employee_id:em2.id)
      ct.clockin.should == true
      ct2.clockin.should == true
      ct3.clockin.should == false
      ct4.clockin.should == false
      ct5.clockin.should == true
      ct6.clockin.should == true
    end
  end

  describe :for_employee do
    it "should return times for an employee" do
      em1 = Employee.create!(pin: "a")
      em2 = Employee.create!(pin: "b")
      ct = ClockTime.create!(employee_id:em1.id)
      ct2 = ClockTime.create!(employee_id:em2.id)
      ct3 = ClockTime.create!(employee_id:em1.id)
      ct4 = ClockTime.create!(employee_id:em2.id)
      ClockTime.for_employee(em1.id).size.should == 2
    end
  end

  describe :for_date_range do
    before :each do
      @ct = ClockTime.create!(created_at: DateTime.now - 7)
      @ct2 = ClockTime.create!
      @ct3 = ClockTime.create!(created_at: DateTime.now - 8)
    end

    it "should return dates within a given range" do
      ClockTime.for_date_range(DateTime.now - 9, DateTime.now).size.should == 3
    end

    it "should not return dates outside of the range" do
      ClockTime.for_date_range(DateTime.now - 7, DateTime.now).size.should == 2
    end
  end

  describe :to_s do
    it "should show a string representation of clock time" do
      em1 = Employee.create!(first_name: "foo", last_name: "bar", pin: "a")
      ct1 = ClockTime.create!(employee_id:em1.id)
      ct1.to_s.should == "#{em1.first_name} #{em1.last_name}: #{I18n.t("clock_time.clockin.true")} #{ct1.created_at}"
    end
  end
end
