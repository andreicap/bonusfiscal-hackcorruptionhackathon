class Citizen < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :tickets, dependent: :destroy
  validates :name, :email, :password, :current_password, :surname, :presence => { :message => "Câmpul este obligatoriu"}
end
