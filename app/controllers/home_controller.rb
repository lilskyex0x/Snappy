class HomeController < ApplicationController
    def home
        if user_signed_in?
          @user = current_user
          @users = User.all
        else
          redirect_to new_user_session_path, notice: "You need to sign in first"
        end
    end
  end