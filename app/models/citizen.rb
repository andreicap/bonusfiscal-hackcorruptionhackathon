class Citizen < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :tickets, dependent: :destroy
  has_many :submissions, dependent: :destroy
  validates :name, :surname, :presence => { :message => "Câmpul este obligatoriu"}
end
