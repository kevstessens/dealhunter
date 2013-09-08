class NewsletterMailer
  default :from => "noresponder@dealhunter.com"

  def newsletter_email(client)
    @offers = Offer.actual.take(6)
    mail(:to => client.user.email, :subject => "Newsletter Dealhunter")
  end

end