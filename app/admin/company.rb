ActiveAdmin.register Company do

  form :partial => "form"

  controller do
    def create
      super
      @company.user.user_role_id = 1
      @company.save!
      NewUserMailer.new_user_email(@company.user, @company).deliver
    end

  end

end
