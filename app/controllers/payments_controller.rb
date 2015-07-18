class PaymentsController < ApplicationController
  before_action :set_billing, only: [:edit_billing, :update_billing]
  before_action :set_withdraw, only: [:edit_withdraw, :update_withdraw]
  before_filter :check_balance if current_user

  def billing
    @billing = current_user.billing.new
    @list_bank = BankName.all
    @list_billing = current_user.billing.where(id: !nil)
  end

  def withdraw
    @billings = current_user.billing
    @list_bank = BankName.all
    @withdraws = current_user.withdraws
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
        ConfirmationDeposit.new(deposit_id:@deposit.id, user_id: @deposit.user_id).save
        redirect_to :back, notice: "Terima Kasih, Deposit anda akan kami proses maksimum 1x24jam. Mohon di isi confirmation deposit setelah anda selesai melakukan transfer"
      else
        redirect_to :back, notice: "Your Deposit can't save and Please fill with input valid"
      end
    else
      redirect_to :back, notice: "Please Make Sure Your Password is Valid"
    end
  end

  def edit_confirmation_deposit
    @deposit = current_user.deposits.find_by(token: params[:id])
    @confirmation_deposit = @deposit.confirmation_deposit
    @list_bank = BankName.all
  end

  def edit_billing
    @list_bank = BankName.all
  end

  def edit_withdraw
    @list_bank = BankName.all
    @billings = current_user.billing
  end

  def update_confirmation_deposit
    if current_user.valid_password?(params[:password])
      @deposit = Deposit.find_by(token: params[:deposit_token])
      change_param = params_confirmation_deposit
      change_param["date_transfer"] = Date.strptime(params_confirmation_deposit[:date_transfer], "%m/%d/%Y").strftime("%Y/%m/%d %H:%M:%S")
      if @deposit.confirmation_deposit.update_attributes(change_param)
        @deposit.update_attributes(status: 2)
        redirect_to deposit_payments_url, notice: "Terima Kasih Sudah melakukan Konfirmasi Transfer, Deposit anda akan kami proses maksimum 1x24jam."
      else
        redirect_to deposit_payments_url, notice: "Your Confirmation can't save and Please fill with input valid"
      end
    else
      redirect_to deposit_payments_url, notice: "Please Make Sure Your Password is Valid"
    end
  end

  def update_billing
    if current_user.valid_password?(params[:password])
      if @billing.update_attributes(param_billing)
        redirect_to billing_payments_url, notice: "Terima Kasih. Proses Penggantian Data Bank Berhasil."
      else
        redirect_to billing_payments_url, notice: "Your data Billing can't update and Please fill with input valid"
      end
    else
      redirect_to billing_payments_url, notice: "Please Make Sure Your Password is Valid"
    end
  end

  def update_withdraw
    if current_user.valid_password?(params[:password])
      set_params = param_withdraw
      if set_params[:billing_id].nil?
        set_params[:billing_id] = nil
      end
      if @withdraw.update_attributes(set_params)
        redirect_to withdraw_payments_url, notice: "Terima Kasih. Proses Update Data WithDraw Berhasil."
      else
        redirect_to withdraw_payments_url, notice: "Your data Withdraw can't update and Please fill with input valid"
      end
    else
      redirect_to withdraw_payments_url, notice: "Please Make Sure Your Password is Valid"
    end
  end

  def trash_deposit
    @deposit = Deposit.find(params[:id])
    @deposit.update_attributes(trash: true)
    redirect_to :back, notice: "Your Deposit has been cancel"
  end

  def create_billing
    if current_user.valid_password?(params[:password])
      @billing = current_user.billing.new(param_billing)
      if @billing.save
        redirect_to billing_payments_url, notice: "Terima Kasih Sudah menambahkan data Billing anda."
      else
        redirect_to billing_payments_url, notice: "Your Confirmation can't save and Please fill with input valid"
      end
    else
      redirect_to billing_payments_url, notice: "Please Make Sure Your Password is Valid"
    end
  end

  def create_withdraw
    if current_user.valid_password?(params[:password])
      @withdraw = current_user.withdraws.new(param_withdraw)
      if @withdraw.save
        redirect_to withdraw_payments_url, notice: "Terima Kasi sudah melakukan Withdraw, Harap menunggu proses konfirmasi dan pengiriman dalam jangka 1x24 Jam."
      else
        redirect_to withdraw_payments_url, notice: "Your request for Withdraw cant'n save, please fill with valid input"
      end
    else
      redirect_to withdraw_payments_url, notice: "Please Make Sure Your Password is Valid"
    end
  end

  private
    def set_billing
      @billing = current_user.billing.find(params[:id])
    end

    def set_withdraw
      @withdraw = current_user.withdraws.find(params[:id])
    end
    
    def param_deposit
      params.require(:deposit).permit(:user_id, :money, :status)
    end

    def param_withdraw
      params.require(:withdraw).permit(:billing_id, :bank_name_id, :account_number, :account_name, :has_billing, :status, :money, :branch, :city)
    end

    def params_confirmation_deposit
      params.require(:confirmation_deposits).permit(:bank_name_id, :date_transfer, :no_credit, :name_owner_credit, :money, :attach, :money)
    end

    def param_billing
      params.require(:billing).permit(:bank_name_id, :account_number, :owner, :branch, :city)
    end

    def check_balance
      if current_user.balance.nil?
        Balance.new(user_id: current_user.id).save
      end 
    end
end