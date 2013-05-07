class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :username, :email, :password, :password_confirmation

  validates :email, :presence=> true
  validates :username, :presence => true
  #validates :crypted_password, :presence => true
  
end
