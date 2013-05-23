class Branch < ActiveRecord::Base
  has_one :company
  has_one :address

  attr_accessible :address_id, :company_id, :name
end
