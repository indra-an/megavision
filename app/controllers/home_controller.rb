class HomeController < ApplicationController
  before_action :fetch_preferences, :except => [:submit_contact]

  def index
    @vacancies = Vacancy.order(:position => :asc)
    @questions = Question.order(:question => :asc)
    @prices = Price.order(:amount => :asc)
    @landing_images = LandingImage.published.order(:created_at => :desc)
    @channel_cities = ChannelCity.order(:city => :asc)
  end

  def job_detail
    @vacancy = Vacancy.find_by_slug(params[:slug_id])
    raise ActiveRecord::RecordNotFound if @vacancy.nil?
    @vacancies = Vacancy.order(:position => :asc)
  end

  def channel_detail
    @channel_city = ChannelCity.includes(:channel_types, :channel_groups, :packages, :prices).find_by_slug(params[:slug_id])
    raise ActiveRecord::RecordNotFound if @channel_city.nil?

    unless params[:area_slug_id].blank?
      @channel_type = AreaCoverage.find_by_slug(params[:area_slug_id]).area_code.channel_types.first
      @channel_cities_type = ChannelCitiesType.where(channel_city_id: @channel_city.id, channel_type_id: @channel_type.id).first
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def check_area
    @coverages = Coverage.order(:name => :asc)
  end

  def submit_contact
    contact = Contact.new(:name => params[:name], :email => params[:email],
                          :subject => params[:subject], :message => params[:message])

    redirect_to root_path, notice: verify_recaptcha && contact.save ? 'success' : 'danger'
  end

  def subscribe

  end

  def autocomplete_area
    @area = AreaCoverage.join_table.by_slug(params['slug']).by_area(params['q'])

    if(params['with_city'])
      @area = @area.map(&:to_check_api)
    else
      @area = @area.map(&:to_api)
    end

    respond_to do |format|
      format.json { render :json => @area }
    end
  end

  private

  def fetch_preferences
    @preference = Preference.fetch || Preference.new
  end
end
