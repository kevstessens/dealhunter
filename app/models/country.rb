class Country < ActiveRecord::Base
  belongs_to :address

  attr_accessible :name
end
