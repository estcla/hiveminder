class InspectionsController < ApplicationController
  def index
    @inspections = Inspection.all
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

private

  def inspection_params
    params.require(:inspection).permit(:date, :time_of_day, :user_id, :hive_id, :tag_list)
  end

end
