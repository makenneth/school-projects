class SessionsController < ApplicationController
   def new
      @user = User.new
      render :new
   end

   def create
      @user = User.find_by_credentials(params[:user][:email],
                                       params[:user][:password]
                                       )

      if @user.nil?
         flash.now[:errors] = ["Invalid Username or password"]
         new
      else
         log_in_user!(@user)
         if @user.activated
            redirect_to bands_url
         else
            render :activation_page
         end
      end
   end


   def destroy
      log_out!
      redirect_to bands_url
   end
end
