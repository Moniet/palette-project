class UsersController < ApplicationController

    before_action :authorize_user
    before_action :current_user, only: [:show]
    skip_before_action :authorize_user, only: [:new, :create, :home]


    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
        if user.valid?
            redirect_to user_path(user)
        else
            flash[:errors] = user.errors.full_messages
            redirect_to user_path(user)
        end
    end

    def show
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :bio)
    end

end
