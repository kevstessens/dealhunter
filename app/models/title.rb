class Title < ActiveRecord::Base
  has_many :clients, :through => :client_title
  has_many :offers, :through => :offers_titles

  attr_accessible :name
end
