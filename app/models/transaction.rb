class Transaction < ApplicationRecord
	belongs_to :credit_bank_account, class_name: 'BankAccount'
  belongs_to :debit_bank_account, class_name: 'BankAccount'
	before_validation :check_balance  
  after_create :update_bank_accounts
  
  def check_balance
  	errors.add(:balance, "Dont have sufficient balance to transtion") if debit_bank_account.balance <= 0.0
  end
  

  def update_bank_accounts
    credit_balance = credit_bank_account.balance.to_f + amount.to_f
    debit_balance = debit_bank_account.balance.to_f - amount.to_f
    credit_bank_account.update(balance: credit_balance, updated_at: DateTime.now)
    debit_bank_account.update(balance: debit_balance, updated_at: DateTime.now)
  end
end
