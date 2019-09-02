class BankAccountsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_account_number

  def amount_transfer
    @bank_account = current_user.bank_account
  end

  def transfer
    credit_acc = params[:credit_acc]
    credit_acc_no = BankAccount.find_by(account_number: credit_acc)
    @transaction = Transaction.create!(credit_bank_account: credit_acc_no,
                                       debit_bank_account: @debit_account_no,
                                       amount: params[:amount],
                                       bank_account_id: @debit_account_no
                                       )
    redirect_to root_path
  end

  def set_account_number
  	@debit_account_no = BankAccount.find_by(account_number: debit_acc)
  end

end
