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
    @preference.background_area_channel = params[:background_area_channel] if params[:background_area_channel].present?
    @preference.background_question_answer = params[:background_question_answer] if params[:background_question_answer].present?
    @preference.background_history = params[:background_history] if params[:background_history].present?
    @preference.background_vision_mission = params[:background_vision_mission] if params[:background_vision_mission].present?
    @preference.background_vacancy = params[:background_vacancy] if params[:background_vacancy].present?
    @preference.background_contact = params[:background_contact] if params[:background_contact].present?

    if @preference.save
      redirect_to admins_preferences_path, notice: 'Website preferences saved.'
    else
      render :preferences
    end
  end

  def area_coverages
    @coverages = Coverage.order(:name => :asc)
  end

  def save_area_coverages
    if params[:new_region_names].count.eql?(params[:new_region_coords].count)
      params[:new_region_names].each_with_index do |name, index|
        coordinates = params[:new_region_coords][index].split('|').reject(&:empty?)
        coordinates = coordinates.map { |coordinate| coordinate.split(',') }
        Coverage.create(:name => name, :coordinates => coordinates)
      end
    end

    redirect_to admins_area_coverages_path, notice: 'Area coverage coordinates saved.'
  end

  def destroy_area_coverage
    coverage = Coverage.find(params[:id])
    coverage.destroy

    redirect_to admins_area_coverages_path, notice: 'Area coverage deleted.'
  end
end
