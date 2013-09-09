class OfferStartMailer < ActionMailer::Base
  default :from => "noresponder@dealhunter.com"

  def offer_start_email(user)
    @user = user
    mail(:to => user.email, :subject => "Comienza tu oferta!")
  end

end