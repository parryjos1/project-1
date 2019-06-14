class User < ApplicationRecord

  has_many :portfolios

  has_and_belongs_to_many :bitcoins

  has_secure_password
end
