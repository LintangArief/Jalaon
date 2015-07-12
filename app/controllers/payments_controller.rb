class PaymentsController < ApplicationController

  def billing

  end

  def withdraw
  
  end

  def history
  
  end

  def deposit
    @list_deposit = current_user.deposits
  end

  def transaction
  
  end
  
  def balance
  
  end
  
  def new_payment
  
  end

  def edit_payment
  
  end

  def create_deposit
    if current_user.valid_password?(params[:deposit][:password])
      @deposit = current_user.deposits.new(param_deposit)
      @deposit.save
      redirect_to :back, notice: "Your Deposit has been save and Please go to your email to check next phase"
    else
      redirect_to :back, notice: "Please Make Sure Your Password is Valid"
    end
  end

  private
    def param_deposit
      params.require(:deposit).permit(:user_id, :money, :status)
    end

    def param_withdraw
      params.require(:withdraw).permit(:user_id, :money, :status)
    end
end