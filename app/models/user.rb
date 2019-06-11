class User < ApplicationRecord

  has_many :portfolios

  has_secure_password
end
