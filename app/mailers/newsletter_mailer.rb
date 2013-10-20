class NewsletterMailer < ActionMailer::Base
  default :from => "noresponder@dealhunter.com"

  def newsletter_email(client)
<<<<<<< HEAD
    offers=Array.new
    Offer.all.each do |offer|
      if offer.weight(client.id)>0
        offers.append(offer)
      end
    end
    @offers=offers.sort_by {|e| e.current_weight}.reverse.take(6)
    #clients_titles = ClientsTitles.select("title_id").where(:client_id => client.id)
    #@offers = Offer.actual.where(:id => OffersTitles.select("offer_id").where(:title_id => clients_titles)).all.take(6)
    mail(:to => "kevstessens@gmail.com", :subject => "Newsletter Dealhunter")
    #mail(:to => client.email, :subject => "Newsletter Dealhunter")
=======
    clients_titles = ClientsTitles.select("title_id").where(:client_id => client.id)
    @offers = Offer.actual.where(:id => OffersTitles.select("offer_id").where(:title_id => clients_titles)).all.take(6)
    mail(:to => client.user.email, :subject => "Newsletter Dealhunter")

>>>>>>> 7804183365ea33126a1d7c982f1837fc6ce44827
  end

end