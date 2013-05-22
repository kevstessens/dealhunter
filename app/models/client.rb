class Client < ActiveRecord::Base
  has_one :user

  attr_accessible :address_id, :first_name, :last_name, :user_id
end
