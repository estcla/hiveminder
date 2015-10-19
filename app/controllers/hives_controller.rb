class HivesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @hives = Hive.all.order("created_at ASC")
    @inspections = Inspection.all
    @int = 0
  end

  def new
    @hive = Hive.new
  end

  def create
        @hive = Hive.new(hive_params)
    @hive.user = current_user

    if @hive.save
      flash[:notice] = 'Hive added'
      redirect_to hives_path
    else
      flash[:errors] = @hive.errors.full_messages.join(". ")
      redirect_to new_hive_path
    end
  end

  def show
    @hive = Hive.find(params[:id])
  end

  def edit
    @hive = Hive.find(params[:id])
  end

  def update
    @hive = Hive.find(params[:id])
    @hive.update(name: hive_params[:name], location: hive_params[:location],
                 established: hive_params[:established], health: hive_params[:health],
                 tag_list: hive_params[:tag_list] )
    if @hive.save
      flash[:notice] = 'Hive updated'
      redirect_to hives_path
    else
      flash[:errors] = @hive.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @hive = Hive.find(params[:id])
    @hive.destroy
    flash[:success] = 'Hive deleted'
    redirect_to hives_path
  end

  private

  def hive_params
    params.require(:hive).permit(:name, :established, :location, :health, :tag_list, :user_id)
  end
end
