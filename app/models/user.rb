class User < ActiveRecord::Base
  has_secure_password
  has_many :bucketlists
  validates_presence_of :username, :password, :firstname, :lastname, :email
end
