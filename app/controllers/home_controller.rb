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

  def subscribe
    @package = Package.find_by_slug(params[:package_id])
    channel_packages = ChannelCity.find_by_slug(params["slug_id"]).channel_packages

    @package_lists = channel_packages.map{|c| [c.package.name, c.package.id]}
    @price_lists = channel_packages.find_by(package: @package).prices
    raise ActiveRecord::RecordNotFound if @package.nil? || channel_packages.nil? || @price_lists.nil?
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
