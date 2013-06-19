class Offer < ActiveRecord::Base
  has_one :company
  has_many :prizes
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :titles
  belongs_to :branch


  attr_accessible :company_id, :end_date, :name, :start_date, :photo, :branch_id, :prizes_attributes

  accepts_nested_attributes_for :prizes, :allow_destroy => true

  mount_uploader :photo, PhotoUploader

  validates_presence_of :name, :start_date, :end_date
  validate :time_coherence

  def time_coherence
    errors.add(:start_date, "No puede ser posterior a la fecha de fin") if self.start_date > self.end_date unless (start_date.nil? or end_date.nil?)
  end

end
