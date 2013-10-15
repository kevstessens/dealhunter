class Client < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  has_and_belongs_to_many :titles
  has_one :address
  has_and_belongs_to_many :offers
  belongs_to :newsletter_frequency
  has_and_belongs_to_many :companies

  attr_accessible :first_name, :last_name, :user_id, :address_attributes, :titles, :newsletter_frequency_id

  accepts_nested_attributes_for :address, :allow_destroy => true

  validates_presence_of :user

  def prefer(preference)
    prefer = false
    self.titles.each do |p|
      if preference == p.name
        prefer = true
      end
    end
    return prefer
  end

  def preferences
    ClientsTitles.where(:client_id => self.id).select("title_id, weight")
  end

end
