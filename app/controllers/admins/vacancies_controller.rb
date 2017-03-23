class Admins::VacanciesController < Admins::BaseController
  before_action :set_vacancy, only: [:show, :edit, :update, :destroy]

  # GET /vacancies
  def index
    @vacancies = Vacancy.all
  end

  # GET /vacancies/1
  def show
  end

  # GET /vacancies/new
  def new
    @vacancy = Vacancy.new
  end

  # GET /vacancies/1/edit
  def edit
  end

  # POST /vacancies
  def create
    @vacancy = Vacancy.new(vacancy_params)

    if @vacancy.save
      redirect_to admins_vacancies_path, notice: 'Vacancy was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /vacancies/1
  def update
    if @vacancy.update(vacancy_params)
      redirect_to admins_vacancies_path, notice: 'Vacancy was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vacancies/1
  def destroy
    @vacancy.destroy
    redirect_to admins_vacancies_path, notice: 'Vacancy was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vacancy_params
      params.require(:vacancy).permit(:position, :icon, :location, :requirements => [])
    end
end
