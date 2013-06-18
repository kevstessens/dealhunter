class Address < ActiveRecord::Base
  belongs_to :client, :dependent => :destroy
  belongs_to :branch, :dependent => :destroy
  belongs_to :country

  attr_accessible :city, :country_id, :floor, :number, :state, :street, :client_id, :branch_id

end
