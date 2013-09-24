class ContactMailer < ActionMailer::Base

  default :from =>  "noresponder@dealhunter.com"
  default :to => "kevstessens@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[Dealhunter-contacto] #{message.subject}")
  end

  def new_message_empresa(message)
    @message = message
    mail(:subject => "[Dealhunter-contacto-empresa-potencial] #{message.subject}")
  end
end
