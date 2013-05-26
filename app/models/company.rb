class Company < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy

  attr_accessible :cuit, :name, :user_id, :user_attributes

  validates_presence_of :name, :user

  accepts_nested_attributes_for :user, :allow_destroy => true,
                                :reject_if => proc { |attributes|
                                  attributes['email'].blank? and
                                      attributes['password'].blank?

                                }
end
