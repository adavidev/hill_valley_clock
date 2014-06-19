class CreateClockTimes < ActiveRecord::Migration
  def change
    create_table :clock_times do |t|
      t.integer :employee_id
      t.boolean :in

      t.timestamps
    end
  end
end
