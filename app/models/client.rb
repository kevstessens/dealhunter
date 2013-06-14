class Client < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  has_and_belongs_to_many :titles
  has_one :address
  has_and_belongs_to_many :offers

  attr_accessible :first_name, :last_name, :user_id, :address_attributes

  accepts_nested_attributes_for :address, :allow_destroy => true

  validates_presence_of :user

end
