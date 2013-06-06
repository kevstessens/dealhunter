class Title < ActiveRecord::Base

  has_and_belongs_to_many :offers
  has_and_belongs_to_many :clients
  attr_accessible :name
end
