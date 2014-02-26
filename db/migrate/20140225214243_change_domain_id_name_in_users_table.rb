class ChangeDomainIdNameInUsersTable < ActiveRecord::Migration
  def change
  	rename_column :projects, :domain_id, :company_id

  end
end
