class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :portfolio_id
      t.integer :stock_id
      t.integer :share_price
      t.integer :num_of_shares 

      t.timestamps
    end
  end
end
