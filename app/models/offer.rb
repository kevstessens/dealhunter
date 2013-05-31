class Offer < ActiveRecord::Base
  has_one :company
  has_many :prices
  has_many :clients, :through => :clients_offers
  has_many :titles, :through => :offers_titles

  attr_accessible :company_id, :end_date, :name, :start_date

  validates_presence_of :name, :start_date, :end_date
  validate :time_coherence



  def time_coherence
    errors.add(:start_date, "No puede ser posterior a la fecha de fin") if self.start_date < self.end_date
  end
end
