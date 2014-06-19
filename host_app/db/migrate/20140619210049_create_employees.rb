class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :pin

      t.timestamps
    end
  end
end
