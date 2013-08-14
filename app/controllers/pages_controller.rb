class PagesController < ApplicationController

  skip_before_filter :authenticate_user!

  def work_with_us
    @message=Message.new
  end


  def potential_advertiser
    @message=Message.new
  end


  def we

  end

  def faqs
    session[:body]="page-faq"
  end

  def contact
    @message = Message.new
    get_params(@message)

    if @message.valid?
      ContactMailerTrabajaConNosotros.new_message_trabaja_con_nosotros(@message).deliver
      redirect_to(:back, :notice => "El mensaje se ha enviado correctamente.")
    else
      flash.now.alert = "Completa todos los datos por favor"
      render pages_contact_path
    end
  end

  def contact_potential_advertiser
    @message = Message.new
    get_params(@message)

    if @message.valid?
      ContactMailer.new_message_empresa(@message).deliver
      redirect_to(:back, :notice => "El mensaje se ha enviado correctamente.")
    else
      flash.now.alert = "Completa todos los datos por favor"
      render pages_contact_path
    end
  end


  def terms_and_conds

  end

  def get_params(message)
    unless params[:message].nil?
      data = params[:message]
      message.subject = data[:subject]
      message.body = data[:body]
      if current_user.nil?
        message.name = data[:name]
        message.email = data[:email]
      else
        message.name = current_user.client.last_name
        message.email = current_user.email
      end
    end
  end

end