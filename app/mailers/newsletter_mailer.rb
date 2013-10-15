class NewsletterMailer < ActionMailer::Base
  default :from => "noresponder@dealhunter.com"

  def newsletter_email(client)
    clients_titles = ClientsTitles.select("title_id").where(:client_id => client.id)
    @offers = Offer.actual.where(:id => OffersTitles.select("offer_id").where(:title_id => clients_titles)).all.take(6)
    mail(:to => "galika_tati@hotmail.com", :subject => "Newsletter Dealhunter")
    #mail(:to => client.email, :subject => "Newsletter Dealhunter")
  end

end