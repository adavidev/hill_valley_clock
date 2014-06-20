class AddMoreFieldsToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :first_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :employee_type, :string
  end
end
