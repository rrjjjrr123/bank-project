class TransactionsController < ApplicationController
	
	before_action :authenticate_user!

	def index
		bank_account = BankAccount.find_by(id: params[:bank_account_id])
	  @transactions = bank_account.transactions	
	end
end
