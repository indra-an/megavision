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
  end

  def check_area
    @coverages = Coverage.order(:name => :asc)
  end

  def submit_contact
    contact = Contact.new(:name => params[:name], :email => params[:email],
                          :subject => params[:subject], :message => params[:message])

    redirect_to root_path, notice: verify_recaptcha && contact.save ? 'success' : 'danger'
  end

  private

  def fetch_preferences
    @preference = Preference.fetch || Preference.new
  end
end
