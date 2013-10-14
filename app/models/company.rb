class Company < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  has_many :branches
  has_and_belongs_to_many :clients

  attr_accessible :cuit, :name, :user_id, :user_attributes, :branches_attributes

  validates_presence_of :name, :user

  validates :name, :presence => true, :length => { :minimum => 3, :maximum => 50}

  validates_associated :user

  accepts_nested_attributes_for :user, :allow_destroy => true,
                                :reject_if => proc { |attributes|
                                  attributes['email'].blank? or
                                      attributes['password'].blank?
                                }


  accepts_nested_attributes_for :branches, :allow_destroy => true

  def email
    self.user.email unless self.user.nil?
  end

end
