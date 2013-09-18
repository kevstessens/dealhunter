task :cron => :environment do
  Offer.all.each do |offer|
    if offer.start_date.to_date == DateTime.current.to_date
      offer.clients.each do |client|
        OfferStartMailer.offer_start_email(client).deliver
      end
    end
  end
end