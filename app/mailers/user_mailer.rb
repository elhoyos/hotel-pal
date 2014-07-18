class UserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  default from: "from@example.com"
  
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to HotelPal')
  end
end