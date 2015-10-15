class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @hives = Hive.all
  end
end
