class Company < ActiveRecord::Base
  has_many :company_employees
  has_many :users, :through => :company_employees
end
