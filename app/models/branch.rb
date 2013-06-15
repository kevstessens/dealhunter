class Branch < ActiveRecord::Base
  has_one :company
  has_one :address

  attr_accessible :address_id, :company_id, :name

  validates_presence_of :name, :company

  accepts_nested_attributes_for :address, :allow_destroy => true

  validates :name, :presence => true, :length => { :minimum => 3, :maximum => 25}


end
