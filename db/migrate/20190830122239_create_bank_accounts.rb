class CreateBankAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_accounts do |t|
      t.integer :account_number
      t.float :balance, default: 0.00
      t.belongs_to :user
      t.timestamps
    end
  end
end
