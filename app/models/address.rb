class Address < ActiveRecord::Base
  belongs_to :client
  belongs_to :branch

  attr_accessible :city, :country_id, :floor, :number, :state, :street
end
