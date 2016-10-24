class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :password, :firstname, :lastname, :email
end
