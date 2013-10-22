class Offer < ActiveRecord::Base
  has_many :prizes
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :titles
  belongs_to :branch

  attr_accessible :end_date, :gmaps, :name, :start_date, :photo, :branch_id, :prizes_attributes, :description, :titles
  attr_accessor :current_weight

  accepts_nested_attributes_for :prizes, :allow_destroy => true

  mount_uploader :photo, PhotoUploader

  validates_presence_of :name, :start_date, :end_date
  validate :time_coherence

  scope :ended, Offer.where('end_date < ?', Date.today)
  scope :actual, Offer.where('end_date >= ?', Date.today)

  def time_coherence
    errors.add(:start_date, "No puede ser posterior a la fecha de fin") if self.start_date > self.end_date unless (start_date.nil? or end_date.nil?)
  end

  def company
    self.branch.company unless self.branch.nil?
  end

  def gmaps
    self.branch.address.gmaps
  end



  acts_as_gmappable

  def gmaps4rails_address
    "#{self.branch.address.street} #{self.branch.address.number}, #{self.branch.address.city}"
    #"#{self.street} #{self.number}, #{self.city}, #{self.country.name}"
  end


  def gmaps4rails_infowindow
    "<a href='http://localhost:3000/offers/#{self.id}'><h4>#{self.name}</h4></a>"
  end


  def latitude
    self.branch.address.latitude
  end

  def longitude
    self.branch.address.longitude
  end

  def weight(id) #recibe el id del cliente en cuestion
    sum = 0
    Client.find(id).preferences.each do |pref|
      self.titles.all.each do |title|
        if title == Title.find(pref.title_id)
          sum = sum + pref.weight.to_i
        end
      end
    end
    company_weight = ClientsCompany.where(:client_id => id, :company_id => self.company.id).select("weight").first.weight
    self.current_weight = sum + company_weight
    return sum
  end
end
