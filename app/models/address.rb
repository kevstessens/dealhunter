class Address < ActiveRecord::Base
  belongs_to :client
  belongs_to :branch
  belongs_to :country

  attr_accessible :city, :country_id, :floor, :number, :state, :street, :client_id
end
