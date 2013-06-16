class Address < ActiveRecord::Base
  belongs_to :client, :dependent => :destroy
  belongs_to :branch
  belongs_to :country

  attr_accessible :city, :country_id, :floor, :number, :state, :street, :client_id

  validates :state, :presence => true, :length => { :minimum => 4, :maximum => 100}, :on => :update
  validates :street, :presence => true, :length => { :minimum => 4, :maximum => 100}, :on => :update
  validates :city, :presence => true, :length => { :minimum => 4, :maximum => 100}, :on => :update
  validates :postcode, :presence => true, :length => { :minimum => 4, :maximum => 20}, :on => :update
  validates :number, :presence => true, :numericality => true ,:length => { :minimum => 1, :maximum => 10}, :on => :update

end
