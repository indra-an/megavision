class Admins::DashboardController < Admins::BaseController
  def index
  end

  def update_password
    current_admin.password = params[:new_password]
    current_admin.password_confirmation = params[:retype_new_password]
    @status = current_admin.save
    @error_message = current_admin.errors.first.join(' ').titleize unless @status
  end

  def preferences
    @preference = Preference.fetch || Preference.new
  end

  def save_preferences
    @preference = Preference.fetch || Preference.new
    @preference.about_megavision = params[:about_megavision]
    @preference.about_starnet = params[:about_starnet]
    @preference.company_history = params[:company_history]
    @preference.company_vision_missions = params[:company_vision_missions]
    @preference.addresses = params[:addresses]
    @preference.copyright_text = params[:copyright_text]
    @preference.linked_in_url = params[:linked_in_url]
    @preference.facebook_url = params[:facebook_url]
    @preference.twitter_url = params[:twitter_url]

    if @preference.save
      redirect_to admins_preferences_path, notice: 'Website preferences saved.'
    else
      render :preferences
    end
  end
end
