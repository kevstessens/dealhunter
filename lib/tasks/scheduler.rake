task :cron => :environment do
  Client.all.each do |c|
    Offer.all.each do |offer|

      print(offer.start_date.hour)
      print(DateTime.current.hour)

      print(offer.start_date.day)
      print(DateTime.current.day)

      if offer.start_date.hour == DateTime.current.hour and offer.start_date.day == DateTime.current.day
        offer.clients.each do |client|
          OfferStartMailer.offer_start_email(client.user, offer).deliver
          print("Se envio algo")
          #broadcast ("/offers/start/"+client.id, offer)
        end
      end

      if offer.end_date.hour == DateTime.current.hour and offer.end_date.day == DateTime.current.day
        OfferEndMailer.offer_end_email(offer.branch.company.user, offer).deliver
      end

    end
end

def broadcast(channel, offer)
  message = {:channel => channel, :data => offer}
  uri = URI.parse("http://localhost:9292/faye")
  Net::HTTP.post_form(uri, :message => message.to_json)
  #No puedo hacer que esto funcione, que se haga el post
  print("channel: "+channel.to_s+" offer: "+offer.to_s)
end

task :daily_news_cron => :environment do
  Client.all.each do |client|
    unless client.newsletter_frequency.nil?
      if client.newsletter_frequency.days == 7
        NewsletterMailer.newsletter_email(client).deliver
      end
    end
  end
end

task :week_news_cron => :environment do
  Client.all.each do |client|
    if client.newsletter_frequency.days == 1
      NewsletterMailer.newsletter_email(client).deliver
    end
  end
end