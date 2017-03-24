class HomeController < ApplicationController
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
    @channel_city = ChannelCity.find_by_slug(params[:slug_id])
    raise ActiveRecord::RecordNotFound if @channel_city.nil?
  end

  def submit_contact
    contact = Contact.new(:name => params[:name], :email => params[:email],
                          :subject => params[:subject], :message => params[:message])

    redirect_to root_path, notice: contact.save ? 'success' : 'danger'
  end
end
