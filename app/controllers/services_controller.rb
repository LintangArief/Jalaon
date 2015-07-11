class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy, :follow, :unfollow, :check_owner]
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :follow, :unfollow]
  before_action :check_owner, only: [:edit, :destroy]
  # GET /services
  # GET /services.json
  def index
    @services ||= find_products
    @service_categories = ServiceCategory.show_all
  end

  def check_owner
    if @service.user == current_user
      return true
    else
      redirect_to root_path,  notice: "You don't have access for this service."
    end
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
      params.require(:service).permit(:service_category_id, :title, :description, :rate_price, :avatar, :address, :latitude, :longitude, :properties, :product_services_attributes => [:title, :description, :price, "_destroy", :foto_product_services_attributes => [:avatar, "avatar", "_destroy"]]).tap do |whitelisted|
        whitelisted[:properties] = params[:service][:properties] 
      end
    end

    def find_products
      params.reject! {|key,val| key == "controller" || key == "action" || key == "commit"}
      if params.any? { |(key, value)| key == "address_1" || key == "service_category_id" || key == "title" }
        services = Service.all
        services = services.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
        services = services.near([params[:latitude], params[:longitude]], params[:dstn], :order => 'distance') if params[:latitude].present?
        if params[:service_category_id] != "0"
          services = services.where(service_category_id: params[:service_category_id]) if params[:service_category_id].present?
        end
        if params[:sv].present?
          if params[:sv] == "2"
            services = services.order("title DESC")
          end
        end
        if params[:sp].present?
          if params[:sp] == "1"
            services = services.order("title DESC")
          elsif params[:sp] == "2"
            services = services.order("title DESC")
          else
            services = services.order("title DESC")
          end
        end
        services.page params[:page]
      else
        services = nil
      end
    end
end