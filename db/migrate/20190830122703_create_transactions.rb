class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :credit_bank_account
      t.references :debit_bank_account
      t.float :amount
      t.belongs_to  :bank_account
      t.timestamps
    end
  end
end
