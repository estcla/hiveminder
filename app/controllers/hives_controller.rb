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

  private

  def hive_params
    params.require(:hive).permit(:name, :established, :location, :health, :user_id)
  end
end
