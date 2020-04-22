class UsersController < ApplicationController

    def index
        @users = User.all
        if @users
            render json: {
            users: @users
            }
        else
            render json: {
            status: 500,
            errors: ['No Users Found']
            }
        end
    end

    def show
        @user = User.find(params[:id])
    if @user
        render json: {
            user: @user,
            cubeTimes: @user.records
        }
        else
        render json: {
            status: 500,
            errors: ['User Not Found']
        }
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
        login!
        render json: {
            status: :created,
            user: @user
        }
        else 
        render json: {
            status: 500,
            errors: @user.errors.full_messages
        }
        end
    end

    def delete_last_record
        # byebug
        user = User.find(params[:user_id])
        user.records.last.delete
        render json: {
            status: "success",
            user: user,
            records: user.records
        }
    end

        private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end