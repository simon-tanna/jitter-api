class UsersController < ApplicationController

    def create
        @user = User.create(user_params)

        if @user.errors.any?
            render json: @user.errors, status: :unprocessable_entity
        else
            render json: @user, status: :created
        end
    end

    private 
    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
end
