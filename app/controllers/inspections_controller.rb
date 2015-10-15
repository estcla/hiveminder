class InspectionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @inspections = Inspection.all
    @hives = Hive.all
  end

  def new
    @inspection = Inspection.new
    @hives = Hive.all
  end

  def create
    @inspection = Inspection.new(inspection_params)
    @inspection.user = current_user
    @hives = Hive.all

    if @inspection.save
      flash[:notice] = 'Inspection added!'
      redirect_to inspections_path
    else
      flash[:errors] = @inspection.errors.full_messages.join(". ")
      redirect_to new_inspection_path
    end
  end

  def show
    @inspection = Inspection.find(params[:id])
  end

  def edit
    @inspection = Inspection.find(params[:id])
    @hives = Hive.all
  end

  def update
    @hives = Hive.all
    @inspection = Inspection.find(params[:id])
    @inspection.update(date: inspection_params[:date], time_of_day: inspection_params[:time_of_day], hive_id: inspection_params[:hive_id], tag_list: inspection_params[:tag_list])
    if @inspection.save
      flash[:notice] = 'Inspection updated'
      redirect_to inspections_path
    else
      flash[:errors] = @inspection.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @inspection = Inspection.find(params[:id])
    @inspection.destroy
    flash[:success] = 'Inspection deleted'
    redirect_to inspections_path
  end

private

  def inspection_params
    params.require(:inspection).permit(:date, :time_of_day, :user_id, :hive_id, :tag_list)
  end

end
