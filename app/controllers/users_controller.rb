class UsersController < ApplicationController
   before_action :setup_errors
   before_action :is_admin?, only: [:index]

   def activate
      @token = params[:activation_token]
      @user = User.find_by(activation_token: @token)
      unless @user.activated
         @user.toggle(:activated)
         log_in_user!(@user)
      end
      redirect_to bands_url
   end

   def index
      @users = User.order(:id).all
      render :index
   end

   def new
      @user = User.new
      render :new
   end

   def create
      @user = User.new(user_params)
      if @user.save
         log_in_user!(@user)
         redirect_to bands_url
      else
         flash.now[:errors] << "Incorrect Username or password"
         render :new
      end
   end

   def show
      @user = User.find(params[:id])
      render :show
   end

   private

   def user_params
      params.require(:user).permit(:email, :password)
   end
end
