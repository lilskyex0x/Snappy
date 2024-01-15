class UsersController < ApplicationController
    def show
      @user = User.find_by_id(params[:id])
  
      if @user.nil?
        redirect_to home_path
      end
    end
end