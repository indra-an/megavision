class Admins::ChannelGroupsController < Admins::BaseController
  before_action :load_channels, except: [:index, :show, :destroy]
  before_action :set_channel_group, only: [:edit, :update, :destroy]

  # GET /channel_groups
  def index
    @channel_groups = ChannelGroup.all
  end

  # GET /channel_groups/new
  def new
    @channel_group = ChannelGroup.new
  end

  # GET /channel_groups/1/edit
  def edit
  end

  # POST /channel_groups
  def create
    @channel_group = ChannelGroup.new(channel_group_params)

    if @channel_group.save
      redirect_to admins_channel_groups_path, notice: 'Channel group was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /channel_groups/1
  def update
    if @channel_group.update(channel_group_params)
      redirect_to admins_channel_groups_path, notice: 'Channel group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /channel_groups/1
  def destroy
    @channel_group.destroy
    redirect_to admins_channel_groups_path, notice: 'Channel group was successfully destroyed.'
  end

  private
    def load_channels
      @channels = Channel.select(:id, :name).collect { |tag| [tag.name, tag.id] }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_channel_group
      @channel_group = ChannelGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def channel_group_params
      params.require(:channel_group).permit(:name, :channel_ids => [])
    end
end
