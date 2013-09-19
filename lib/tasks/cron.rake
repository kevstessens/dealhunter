task :cron => :environment do
  Offer.all.each do |offer|
    if offer.start_date.to_date == DateTime.current.to_date
      offer.clients.each do |client|
        OfferStartMailer.offer_start_email(client).deliver
        #broadcast ("/offers/start/"+client.id, offer)
      end
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