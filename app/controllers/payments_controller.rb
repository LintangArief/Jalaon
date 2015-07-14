class PaymentsController < ApplicationController

  def billing

  end

  def withdraw
  
  end

  def history
  
  end

  def deposit
    @list_deposit = current_user.deposits.where(trash: false)
    @list_bank = BankName.all
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
      if @deposit.save
        @deposit.confirmation_deposits.new(user_id: @deposit.user_id).save
        redirect_to :back, notice: "Your Deposit has been save and Please go to your email to check next phase"
      else
        redirect_to :back, notice: "Your Deposit can't save and Please fill with input valid"
      end
    else
      redirect_to :back, notice: "Please Make Sure Your Password is Valid"
    end
  end

  def edit_confirmation_deposit
    @deposit = Deposit.find_by(token: params[:id])
    @confirmation_deposit = @deposit.confirmation_deposit
    @list_bank = BankName.all
  end

  def update_confirmation_deposit
    if current_user.valid_password?(params[:password])
      @deposit = Deposit.find_by(token: params[:deposit_token])
      change_param = params_confirmation_deposit
      change_param["date_transfer"] = Date.strptime(params_confirmation_deposit[:date_transfer], "%m/%d/%Y").strftime("%Y/%m/%d %H:%M:%S")
      if @deposit.confirmation_deposit.update_attributes(change_param)
        @deposit.update_attributes(status: 2)
        redirect_to deposit_payments_url, notice: "Your Deposit has been save and Please wait 1x24 hour for transfer balance to this Account"
      else
        redirect_to deposit_payments_url, notice: "Your Confirmation can't save and Please fill with input valid"
      end
    else
      redirect_to deposit_payments_url, notice: "Please Make Sure Your Password is Valid"
    end
  end

  def trash_deposit
    @deposit = Deposit.find(params[:id])
    @deposit.update_attributes(trash: true)
    redirect_to :back, notice: "Your Deposit has been cancel"
  end

  private
    def param_deposit
      params.require(:deposit).permit(:user_id, :money, :status)
    end

    def param_withdraw
      params.require(:withdraw).permit(:user_id, :money, :status)
    end

    def params_confirmation_deposit
      params.require(:confirmation_deposits).permit(:bank_name_id, :date_transfer, :no_credit, :name_owner_credit, :money, :attach)
    end
end
