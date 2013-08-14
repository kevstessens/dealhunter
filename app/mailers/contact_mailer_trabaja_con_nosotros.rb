class ContactMailerTrabajaConNosotros < ActionMailer::Base

  default :from => "admin.docnet@gmail.com"
  default :to => "kevstessens@gmail.com"

  def new_message_trabaja_con_nosotros(message)
    @message = message
    mail(:subject => "[Dealhunter-contacto-empresa-potencial]")
  end

end
