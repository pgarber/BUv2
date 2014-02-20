class DropCompanyEmployees < ActiveRecord::Migration
  def change
  	drop_table :company_employees
  end
end
