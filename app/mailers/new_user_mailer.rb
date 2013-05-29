class NewUserMailer < ActionMailer::Base
  default :from => "noresponder@dealhunter.com"

  def new_user_email(user)
    @user = user
    mail(:to => user.email, :subject => "Bienvenido a Dealhunter!")
  end

  def new_client_email(user)
    @user = user
    mail(:to => user.email, :subject => "Bienvenido a Dealhunter!")
  end

end
