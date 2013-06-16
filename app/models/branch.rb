class Branch < ActiveRecord::Base
  has_one :company
  has_one :address

  attr_accessible :address_id, :company_id, :name, :address_attributes

  validates_presence_of :name, :company_id

  accepts_nested_attributes_for :address, :allow_destroy => true

  validates :name, :presence => true, :length => { :minimum => 4, :maximum => 25}

  def address_as_string
    unless self.address_id.nil?
      address = Address.find_by_id(self.address_id)
      address.street + " " + address.number.to_s + " - " + address.city + ", " + address.state
    end
  end


end
