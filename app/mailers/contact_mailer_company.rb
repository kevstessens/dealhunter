class ContactMailerCompany < ActionMailer::Base

  default :from =>  "noresponder@dealhunter.com"
  default :to => "kevstessens@gmail.com"

  def new_message_company(message)
    @message = message
    mail(:subject => "[Dealhunter-contacto-empresa-Alta]")
  end

end
