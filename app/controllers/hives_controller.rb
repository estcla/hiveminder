class HivesController < ApplicationController
  def index
    @hives = Hive.all
  end

  def new
    @hive = Hive.new
  end

  def create
    @hive = Hive.new(hive_params)
    @hive.user = current_user

    if @hive.save
      flash[:notice] = 'Hive added!'
      redirect_to hives_path
    else
      flash[:errors] = @hive.errors.full_messages.join(". ")
      redirect_to new_hive_path
    end
  end

  def show
    @hive = Hive.find(params[:id])
  end

  def update
    @hive
    @hive.update(name: hive_params[:name], location: hive_params[:location])
    if @hive.save
      redirect_to hive_path
    else
      flash[:errors] = @hive.errors.full_messages.join(". ")
      render :show
    end
  end

  private

  def hive_params
    params.require(:hive).permit(:name, :established, :location, :health, :user_id)
  end
end
