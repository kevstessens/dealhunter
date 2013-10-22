class RecommendOfferMailer < ActionMailer::Base
  default :from => "noresponder@dealhunter.com"

  def recommend_offer_email(user, offer, email)
    @user = user
    @offer = offer
    mail(:to => email, :subject => "¡Un amigo te ha recomendado una oferta!")
  end

end