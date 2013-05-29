class PagesController < ApplicationController

  skip_before_filter :authenticate_user!

  def work_with_us

  end

  def we

  end

  def faqs
    session[:body]="page-faq"
  end

  def contact
    unless params[:user].nil?
      first_name = params[:user][:first_name]
      last_name = params[:user][:last_name]
      email = params[:user][:email]
      subject = params[:user][:full_name]
      content = params[:user][:contrasena]
      ContactMailer.contact_email(first_name,last_name,email,subject,content).deliver
    end


  end

  def terms_and_conds

  end
end
