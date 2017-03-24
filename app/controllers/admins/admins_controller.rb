class Admins::AdminsController < Admins::BaseController
  before_action :set_admin, only: [:destroy]

  # GET /admins
  def index
    @admins = Admin.all
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to admins_admins_path, notice: 'Admin was successfully created.'
    else
      render :new
    end
  end

  # DELETE /admins/1
  def destroy
    @admin.destroy
    redirect_to admins_admins_path, notice: 'Admin was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation)
    end
end
