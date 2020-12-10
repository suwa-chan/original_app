class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cosons = @user.cosons
  end
end
