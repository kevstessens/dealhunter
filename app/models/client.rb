class Client < ActiveRecord::Base
  has_one :user, :dependent => :destroy
  has_many :titles, :through => :client_title

  attr_accessible :address_id, :first_name, :last_name, :user_id

  validates_presence_of :user_id
end
