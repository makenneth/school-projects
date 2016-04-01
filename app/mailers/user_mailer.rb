class UserMailer < ApplicationMailer
   default from: 'from@example.com'

   def welcome_email(user)
      @user = user
      @url = "/users/activate?activation_token=#{@user.activation_token}"
      mail(to: user.email, subject: 'Welcome to my site...')
   end


end
