class Client < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  has_many :titles, :through => :client_title
  has_one :address

  attr_accessible :address_id, :first_name, :last_name, :user_id, :address_attributes

  validates_presence_of :user_id


  accepts_nested_attributes_for :address, :allow_destroy => true,
                                :reject_if => proc { |attributes|
                                  attributes['city'].blank? and
                                      attributes['country'].blank? and
                                      attributes['number'].blank? and
                                      attributes['postcode'].blank? and
                                      attributes['state'].blank? and
                                      attributes['street'].blank?
                                }
end
