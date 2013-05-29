<<<<<<< HEAD
class RegistrationsController < InheritedResources::Base
end
=======
class RegistrationsController < Devise::RegistrationsController


def create
  @user = User.new(params[:user])
  if @user.save
    NewUserMailer.new_user_email(@user).deliver

    if @user.active_for_authentication?
      sign_in("user", @user)
      respond_with @user, :location => after_sign_up_path_for(@user)

    else
      expire_session_data_after_sign_in!
      respond_with @user, :location => after_inactive_sign_up_path_for(@user)
    end
  else
    clean_up_passwords @user
    $user=@user
    redirect_to new_user_registration_path(:registration => false)
    #redirect_to :back
  end
end

def new
  @alert = params[:registration]
  super
end

def update
  super
end
end
>>>>>>> 6bbfedd2baee751f3c27f227dd13f20a5e65a077
