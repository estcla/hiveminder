class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @int = 0
  end
end
