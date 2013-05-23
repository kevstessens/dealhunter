class Offer < ActiveRecord::Base
  has_one :company
  has_many :prices
  has_many :clients, :through => :clients_offers
  has_many :titles, :through => :offers_titles

  attr_accessible :company_id, :end_date, :name, :start_date
end
