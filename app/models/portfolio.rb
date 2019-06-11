class Portfolio < ApplicationRecord
  has_and_belongs_to_many :stocks
  has_and_belongs_to_many :shares
  belongs_to :user, optional: true
end
