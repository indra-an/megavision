class Admins::MenuSettingsController < Admins::BaseController
  before_action :load_resources, except: [:index, :show, :destroy]
  before_action :set_menu_setting, only: [:show, :edit, :update, :destroy]

  # GET /menu_settings
  def index
    @menu_settings = MenuSetting.all
  end

  # GET /menu_settings/1
  def show
  end

  # GET /menu_settings/new
  def new
    @menu_setting = MenuSetting.new
  end

  # GET /menu_settings/1/edit
  def edit
  end

  # POST /menu_settings
  def create
    @menu_setting = MenuSetting.new(menu_setting_params)

    if @menu_setting.save
      redirect_to admins_menu_settings_path, notice: 'Menu was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /menu_settings/1
  def update
    if @menu_setting.update(menu_setting_params)
      redirect_to admins_menu_settings_path, notice: 'Menu was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /menu_settings/1
  def destroy
    @menu_setting.destroy
    redirect_to admins_menu_settings_path, notice: 'Menu was successfully destroyed.'
  end

  private
    def load_resources
      @menu_types = [['Parent', 'MenuParent'], ['Child', 'MenuChild']]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_menu_setting
      @menu_setting = MenuSetting.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def menu_setting_params
      params.require(:menu_setting).permit(:menu, :type, :is_active,
          :hidden_content, :disable_content, :parent_id, :position)
    end
end
