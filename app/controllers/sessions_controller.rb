class SessionsController < ApplicationController
    
    def create
        # changed to username from email
        @user = User.find_by(username: session_params[:username])
        if @user && @user.authenticate(session_params[:password])
            login!
            render json: {
            logged_in: true,
            user: @user
            }
        else
            render json: { 
            status: 401,
            errors: ['User Not Found', 'Verify Credentials and Try Again or Signup']
            }
        end
    end

    def is_logged_in?
        if logged_in? && current_user
            render json: {
            logged_in: true,
            user: current_user
            }
        else
            render json: {
            logged_in: false,
            message: 'User Not Found'
            }
        end
    end
    
    def destroy
        logout!
        render json: {
        status: 200,
        logged_out: true
        }
    end

    private
    def session_params
        params.require(:user).permit(:username, :password)
    end
end