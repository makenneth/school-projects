class UserMailer < ApplicationMailer
   default from: 'Company Name support@company.com'

   def welcome_email(user)
      @user = user
      @url = "http://localhost:3000/users/activate?activation_token=#{@user.activation_token}"
      mail(to: user.email, subject: 'Welcome to my site...')
   end


end
