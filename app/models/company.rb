class Company < ActiveRecord::Base
  has_one :user

  attr_accessible :cuit, :name, :user_id
end
