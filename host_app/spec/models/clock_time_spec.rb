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
     em1 = Employee.create!
     em2 = Employee.create!
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
end
