class User < ActiveRecord::Base
  has_many :facebooks, dependent: :destroy
  has_secure_password
end
