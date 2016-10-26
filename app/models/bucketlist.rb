class Bucketlist < ActiveRecord::Base
  has_many :items
  belongs_to :user

  validates_presence_of :name
end
