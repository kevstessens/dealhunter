ActiveAdmin.register Company do

  form :partial => "form"


  controller do
    def create
      super
      NewUserMailer.new_user_email(@company.user, @company).deliver
    end

  end

end
