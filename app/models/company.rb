class Company < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy

  attr_accessible :cuit, :name, :user_id, :user_attributes

  validates_presence_of :name, :user

  validates :name, :presence => true, :length => { :minimum => 3, :maximum => 50}, :on => :update

  accepts_nested_attributes_for :user, :allow_destroy => true,
                                :reject_if => proc { |attributes|
                                  attributes['email'].blank? and
                                      attributes['password'].blank?
                                }
end
