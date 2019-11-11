class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :company_name
      t.integer :price 

      t.timestamps
    end
  end
end
