class Admins::MovieSchedulesController < Admins::BaseController
  before_action :set_movie_schedule, only: [:show, :edit, :update, :destroy]

  # GET /movie_schedules
  def index
    @movie_schedules = MovieSchedule.all
  end

  # GET /movie_schedules/1
  def show
  end

  # GET /movie_schedules/new
  def new
    @movie_schedule = MovieSchedule.new
  end

  # GET /movie_schedules/1/edit
  def edit
  end

  # POST /movie_schedules
  def create
    @movie_schedule = MovieSchedule.new(movie_schedule_params)

    if @movie_schedule.save
      redirect_to admins_movie_schedules_path, notice: 'Movie Schedule was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /movie_schedules/1
  def update
    if @movie_schedule.update(movie_schedule_params)
      redirect_to admins_movie_schedules_path, notice: 'Movie Schedule was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /movie_schedules/1
  def destroy
    @movie_schedule.destroy
    redirect_to admins_movie_schedules_path, notice: 'Movie Schedule was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_schedule
      movie_schedule_id = params[:id] || params[:movie_schedule_id]
      @movie_schedule = MovieSchedule.find(movie_schedule_id)
    end

    # Only allow a trusted parameter "white list" through.
    def movie_schedule_params
      params.require(:movie_schedule).permit(:title, :logo, :schedule_attachment)
    end
end
