class HomeController < ApplicationController
  def index
    @vacancies = Vacancy.order(:position => :asc)
    @questions = Questions.order(:question => :asc)
  end

  def job_detail
    @vacancy = Vacancy.find_by_slug(params[:slug_id])
    raise ActiveRecord::RecordNotFound if @vacancy.nil?
    @vacancies = Vacancy.order(:position => :asc)
  end
end
