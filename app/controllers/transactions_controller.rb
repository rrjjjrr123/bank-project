class TransactionsController < ApplicationController
	
	before_action :authenticate_user!

	def index
	  @transactions = Transaction.where(debit_bank_account_id: params[:bank_account_id])
	end
end
