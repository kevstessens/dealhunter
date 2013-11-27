task :cron => :environment do
  Client.all.each do |c|
    print(c.user.email)
    NewUserMailer.new_client_email(c.user).deliver
    print("Se envio algo")
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