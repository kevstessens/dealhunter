class ApplicationController < ActionController::Base
  before_filter :authenticate_user!

  protect_from_forgery
  before_filter :authenticate_user!

end
