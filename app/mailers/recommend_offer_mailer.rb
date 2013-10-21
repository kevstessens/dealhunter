class RecommendOfferMailer < ActionMailer::Base
  default :from => "noresponder@dealhunter.com"

  def recommend_offer_email(user, offer, email)
    @user = user
    @offer = offer
    mail(:to => email, :subject => "Ha finalizado tu oferta!")
  end

end