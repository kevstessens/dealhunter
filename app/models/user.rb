class User < ActiveRecord::Base
   has_one :user_role
   belongs_to :company
   belongs_to :client

  attr_accessible :email, :password, :role_id

  validates_presence_of :email, :password

end
