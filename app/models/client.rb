class Client < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  has_many :titles, :through => :client_title
  has_one :address

  attr_accessible :first_name, :last_name, :user_id, :address_attributes



  accepts_nested_attributes_for :address, :allow_destroy => true
end
