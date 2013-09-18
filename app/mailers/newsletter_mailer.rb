class NewsletterMailer < ActionMailer::Base
  default :from => "noresponder@dealhunter.com"

  def newsletter_email()
    clients_titles = ClientsTitles.select("title_id").where(:client_id => Client.where(:user_id => @user.id))
    @offers = Offer.actual.where(:id => OffersTitles.select("offer_id").where(:title_id => clients_titles)).all.take(6)
    mail(:to => client.user.email, :subject => "Newsletter Dealhunter")
  end

end