class Guest < ApplicationRecord
  has_many :tickets
  before_save :titleing

  validates :name, :surname, :dob, :presence => { :message => "Câmpul este obligatoriu"}

  def titleing
  	self.name = self.name.split.map(&:capitalize).join(' ')
  	self.surname = self.surname.split.map(&:capitalize).join(' ')
  end
end
