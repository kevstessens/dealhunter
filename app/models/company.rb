class Company < ActiveRecord::Base
  belongs_to :user

  attr_accessible :cuit, :name, :user_id, :user_attributes

  accepts_nested_attributes_for :user, :allow_destroy => true,
                                :reject_if => proc { |attributes|
                                  attributes['email'].blank? and
                                      attributes['password'].blank?

                                }
end
