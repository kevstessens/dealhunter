class Address < ActiveRecord::Base
  belongs_to :client, :dependent => :destroy
  belongs_to :branch, :dependent => :destroy
  belongs_to :country

  attr_accessible :city, :country_id, :country, :floor, :number, :state, :street, :client_id, :branch_id, :address, :longitude, :latitude

  acts_as_gmappable :validation => false

  def gmaps4rails_address
    "#{self.street} #{self.number}, #{self.city}"
    #"#{self.street} #{self.number}, #{self.city}, #{self.country.name}"
  end


  def gmaps4rails_infowindow
    #'<h1 id="firstHeading" class="firstHeading">'+"#{self.client.name}"+'</h1>'+
      '<div id="bodyContent">'+
      "#{self.street} #{self.number}, #{self.city}"+
      #"#{self.street} #{self.number}, #{self.city}, #{self.country.name}"+
      #'<img src="'+self.client.logo_url+'">'+
      '</div>'
  end

end
