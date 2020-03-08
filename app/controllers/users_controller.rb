class UsersController < ApplicationController
	before_action :authenticate_user!
  
  def show
  	@bank_account = current_user.bank_account
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number)
  end	
end

