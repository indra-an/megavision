class HomeController < ApplicationController
  before_action :get_channel_cities, :except => [:submit_contact]
  before_action :fetch_preferences, :except => [:submit_contact]

  def index
    @vacancies = Vacancy.order(:position => :asc)
    @questions = Question.order(:question => :asc)
    @prices = Price.order(:amount => :asc)
    @landing_images = LandingImage.published.order(:created_at => :desc)
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
      @area = AreaCoverage.find_by_slug(params[:area_slug_id])
      @channel_type = @area.area_code.channel_types.first
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

  def submit_subscribe
    data = {}
    params['sub'].map {|k, v| data[k] = v }
    price = Price.find(data['product'])
    data['product_speed'] = ["Up to", price.up_to_speed, price.unit].join(" ")
    data['product_price'] = ["Rp.", number_with_delimiter(price.amount)].join(" ")

    @verify = (verify_recaptcha && params['sub']['cek'].present?)
    ApplicationMailer.send_subscriber(data).deliver if @verify
  end

  def subscribe
    @package = Package.find_by_slug(params[:package_id])
    area_coverage = AreaCoverage.find_by_slug(params["slug_id"])
    @channel_city = area_coverage.channel_city

    channel_packages = area_coverage.area_code.channel_types.first.channel_packages rescue nil
    if channel_packages.present?
      @package_lists = channel_packages.map{|c| [c.package.name]}.uniq
      @price_lists = channel_packages.find_by(package: @package).prices.order(amount: :asc)
      @other_price_lists = channel_packages.where.not(package: @package).first.prices.order(amount: :asc)
    end

    raise ActiveRecord::RecordNotFound if @package.nil? || channel_packages.nil? || @price_lists.nil?
  end

  def autocomplete_area
    @area = AreaCoverage.join_table.by_slug(params['slug']).by_area(params['q']).limit(10)

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

  def get_channel_cities
    @channel_cities = ChannelCity.order(:city => :asc)
  end
  def fetch_preferences
    @preference = Preference.fetch || Preference.new
  end
end
