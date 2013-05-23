class Prize < ActiveRecord::Base
  belongs_to :offer

  attr_accessible :discount_percentage, :name, :offer_id, :real_price
end
