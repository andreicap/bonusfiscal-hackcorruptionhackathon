class Guest < ApplicationRecord
  has_many :tickets
  def titleing
  	self[:name].titleize
  	self[:surname].titleize
  end
end
