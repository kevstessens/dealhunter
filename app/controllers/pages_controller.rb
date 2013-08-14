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
    @message = Message.new(params[:message])
    @message.subject = "--"

    if @message.valid?
      ContactMailerTrabajaConNosotros.new_message_trabaja_con_nosotros(@message).deliver
      redirect_to(:back, :notice => "El mensaje se ha enviado correctamente.")
    else
      flash.now.alert = "Completa todos los datos por favor"
      render :new
    end
  end

  def contact_potential_advertiser
    @message = Message.new(params[:message])

    if @message.valid?
      ContactMailer.new_message_empresa(@message).deliver
      redirect_to(:back, :notice => "El mensaje se ha enviado correctamente.")
    else
      flash.now.alert = "Completa todos los datos por favor"
      render :new
    end
  end


  def terms_and_conds

  end

end
