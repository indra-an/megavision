class HomeController < ApplicationController
  before_action :get_channel_cities, :except => [:submit_contact]
  before_action :fetch_preferences, :except => [:submit_contact]

  def index
    @vacancies = Vacancy.order(:position => :asc)
    @questions = Question.order(:question => :asc)
    @prices = Price.order(:amount => :asc)
    @landing_images = LandingImage.published.order(:created_at => :desc)
    @products = Product.active.order(id: :asc)
    @movie_schedules = MovieSchedule.order(id: :asc)

    #menu
    @beranda = MenuSetting.find_by_slug("beranda")
    @paket = MenuSetting.find_by_slug("paket")
    @jadwal_acara = MenuSetting.find_by_slug("jadwal-acara")
    @karir = MenuSetting.find_by_slug("karir")
    @kontak_kami = MenuSetting.find_by_slug("kontak-kami")
    @sejarah = MenuSetting.find_by_slug("sejarah")
    @faq = MenuSetting.find_by_slug("faq")
    @product_view = MenuSetting.find_by_slug("product")

    #html

    ##beranda
    @beranda_html = Liquid::Template.parse(@beranda.html_content.to_s, :error_mode => :strict)
    @beranda_carousel_indicator = Liquid::Template.parse(@beranda.html_additional[:carousel_indicator].to_s, :error_mode => :strict)
    @beranda_carousel_image = Liquid::Template.parse(@beranda.html_additional[:carousel_image].to_s, :error_mode => :strict)

    ##about
    @product_html = Liquid::Template.parse(@product_view.html_content.to_s, :error_mode => :strict)
    @about_product_html = Liquid::Template.parse(@product_view.html_additional[:about_product_html].to_s, :error_mode => :strict)

    ##paket
    @paket_html = Liquid::Template.parse(@paket.html_content.to_s, :error_mode => :strict)
    @paket_channel_city = Liquid::Template.parse(@paket.html_additional[:channel_city].to_s, :error_mode => :strict)

    ##jadwal
    @jadwal_html = Liquid::Template.parse(@jadwal_acara.html_content.to_s, :error_mode => :strict)
    @jadwal_movie_html = Liquid::Template.parse(@jadwal_acara.html_additional[:movie_schedule].to_s, :error_mode => :strict)

    ##sejarah
    @sejarah_html = Liquid::Template.parse(@sejarah.html_content.to_s, :error_mode => :strict)
    @visi_misi_html = Liquid::Template.parse(@sejarah.html_additional[:vision_mission].to_s, :error_mode => :strict)

    ##karir
    @karir_html = Liquid::Template.parse(@karir.html_content.to_s, :error_mode => :strict)
    @vacancy_html = Liquid::Template.parse(@karir.html_additional[:vacancy].to_s, :error_mode => :strict)

    ##karir
    @faq_html = Liquid::Template.parse(@faq.html_content.to_s, :error_mode => :strict)
    @faq_list_html = Liquid::Template.parse(@faq.html_additional[:faq].to_s, :error_mode => :strict)

    ##kontak
    @kontak_html = Liquid::Template.parse(@kontak_kami.html_content.to_s, :error_mode => :strict)
    @addresslist_html = Liquid::Template.parse(@kontak_kami.html_additional[:address_list].to_s, :error_mode => :strict)

    #end html
  end

  def job_detail
    @karir = MenuSetting.find_by_slug("karir")
    @karir_detail_html = Liquid::Template.parse(@karir.html_additional[:vacancy_detail].to_s, :error_mode => :strict)
    @karir_klasifikasi_html = Liquid::Template.parse(@karir.html_additional[:requirement_list].to_s, :error_mode => :strict)
    @karir_list_html = Liquid::Template.parse(@karir.html_additional[:vacancy_detail_list].to_s, :error_mode => :strict)

    @vacancy = Vacancy.find_by_slug(params[:slug_id])
    raise ActiveRecord::RecordNotFound if @vacancy.nil?
    @vacancies = Vacancy.order(:position => :asc)
  end

  def channel_detail
    @channel_city = ChannelCity.includes(:channel_types, :channel_groups, :packages, :prices).find_by_slug(params[:slug_id])
    raise ActiveRecord::RecordNotFound if @channel_city.nil?

    @paket = MenuSetting.find_by_slug("paket")
    @paket_channel_detail_html = Liquid::Template.parse(@paket.html_additional[:channel_detail].to_s, :error_mode => :strict)
    @paket_package_list_html = Liquid::Template.parse(@paket.html_additional[:package_list].to_s, :error_mode => :strict)
    @paket_left_package_html = Liquid::Template.parse(@paket.html_additional[:left_package].to_s, :error_mode => :strict)
    @paket_left_package_channel_group_html = Liquid::Template.parse(@paket.html_additional[:left_package_channel_group].to_s, :error_mode => :strict)
    @paket_left_package_channel_price_html = Liquid::Template.parse(@paket.html_additional[:left_package_channel_price].to_s, :error_mode => :strict)
    @paket_right_package_html = Liquid::Template.parse(@paket.html_additional[:right_package].to_s, :error_mode => :strict)
    @paket_right_package_channel_group_html = Liquid::Template.parse(@paket.html_additional[:right_package_channel_group].to_s, :error_mode => :strict)
    @paket_right_package_channel_price_html = Liquid::Template.parse(@paket.html_additional[:right_package_channel_price].to_s, :error_mode => :strict)
    
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
    @area_cakupan = MenuSetting.find_by_slug("area-cakupan")
    @area_cakupan_html = Liquid::Template.parse(@area_cakupan.html_content.to_s, :error_mode => :strict)

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
