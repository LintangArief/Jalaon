class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy, :follow, :unfollow]

  # GET /services
  # GET /services.json
  def index
    @services = Service.order(:title).page params[:page]
    @service_categories = ServiceCategory.order(:name)
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @product_service = ProductService.new
    @feedback = Feedback.new
    @show_product = @service.product_services
    @pending = nil
    if current_user
      @pending = @service.user.pending_invited_by.map(&:id).include? current_user.id
    end
  end

  # GET /services/new
  def new
    @service_categories = ServiceCategory.all
    @has_service_category = false
    if params[:service_category_id].nil?
      @service = Service.new  
    else
      @check_service_category = ServiceCategory.where(id: params[:service_category_id])
      if @check_service_category.count > 0
        @service = Service.new(service_category_id: params[:service_category_id])
        @has_service_category = true
      else
        @service = Service.new
        @has_service_category = false
      end
    end
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = current_user.services.new(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def listing
    @services = current_user.services.page params[:page]
  end

  def follow
    current_user.follow!(@service)
    redirect_to @service
  end
  
  def unfollow
    current_user.unfollow!(@service)
    redirect_to service_path(@service)
  end

  def add_friend
    @service = Service.find(params[:id])
    @user = @service.user
    current_user.invite @user
    redirect_to @service
  end

  def cancle_friend
    @service = Service.find(params[:id])
    @user = @service.user
    current_user.remove_friendship @user
    redirect_to @service  
  end

  def un_friend
    @service = Service.find(params[:id])
    @user = @service.user
    current_user.remove_friendship @user
    redirect_to @service
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:service_category_id, :title, :description, :avatar, properties: [{}]).tap do |whitelisted|
        whitelisted[:properties] = params[:service][:properties] 
      end
    end
end
