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
         render :new
      else
         log_in_user!(@user)
         redirect_to bands_url
      end
   end


   def destroy
      log_out!
      redirect_to bands_url
   end
end
