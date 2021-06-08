class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]
  
    # REGISTER
    def create
      if params[:password] != params[:password2]
        render json: {error: "password do not mathc"}
      else
        @user = User.create(email:params[:email],password:params[:password],mark_for_deletion:'f')            
        if @user.valid?
          token = encode_token({user_id: @user.id})
          render json: {user: @user, token: token}
        else
          render json: {error: "Invalid email or password"}
        end
      end
    end
  
    # LOGGING IN
    def login
      puts 'aqine iqine'
      @user = User.find_by(email: params[:email])
  
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid email or password"}
      end
    end
  
  
    def auto_login
      render json: @user
    end
  
    private
  
    def user_params
      params.permit(:username, :password, :age)
    end
  
  end