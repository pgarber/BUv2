class CreateCompanyEmployees < ActiveRecord::Migration
  def change
    create_table :company_employees do |t|
      t.integer :company_id
      t.integer :user_id

      t.timestamps
    end
  end
end
