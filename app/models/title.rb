class Title < ActiveRecord::Base

  has_and_belongs_to_many :offers
  has_and_belongs_to_many :clients
  attr_accessible :name

  validates_presence_of :name

  validates :name, :presence => true, :length => { :minimum => 3, :maximum => 25}
end
