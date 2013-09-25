class PagesController < ApplicationController

  skip_before_filter :authenticate_user!

  def work_with_us
    @message=Message.new
  end

  def form_company
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

  def contact_work_with_us
    @message = Message.new
    get_params(@message)
    if @message.valid?
      ContactMailerTrabajaConNosotros.new_message_trabaja_con_nosotros(@message).deliver
      flash.now.alert = "El mensaje se ha enviado correctamente."
      render pages_work_with_us_path

    else
      flash.now.alert = "Completa todos los datos por favor"
      render pages_work_with_us_path
    end

  end


  def contact
    @message = Message.new
    get_params(@message)

    if @message.valid?
      ContactMailer.new_message(@message).deliver
      flash.now.alert = "El mensaje se ha enviado correctamente."
      render pages_contact_path
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
      flash.now.alert = "El mensaje se ha enviado correctamente."
      render pages_form_company_path
    else
      flash.now.alert = "Completa todos los datos por favor"
      render pages_form_company_path
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
        if current_user.client.last_name.nil?
          message.name = ""
        else
          message.name = current_user.client.last_name
        end
        message.email = current_user.email
      end
    end
  end

end