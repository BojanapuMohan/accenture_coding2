class ChangeEmploeeColumnNames < ActiveRecord::Migration
  def change
  	rename_column :employees, :department, :role
  	rename_column :employees, :rating, :report_to
  end
end
