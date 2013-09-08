class NewsletterMailer < ActionMailer::Base
  default :from => "noresponder@dealhunter.com"
  default :to => "laura_lopez_bukovac@hotmail.com"

  def newsletter_email()
    @offers = Offer.actual.take(6)
    mail(:subject => "Newsletter Dealhunter")
    #mail(:to => client.user.email, :subject => "Newsletter Dealhunter")
  end

end