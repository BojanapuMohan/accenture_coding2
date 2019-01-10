class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :emp_id
      t.string :name
      t.integer :salary
      t.integer :rating

      t.timestamps null: false
    end
  end
end
