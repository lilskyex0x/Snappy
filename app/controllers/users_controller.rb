class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])

    return unless @user.nil?

    redirect_to home_path
  end
end
