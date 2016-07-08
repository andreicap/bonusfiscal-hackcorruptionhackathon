class Ticket < ApplicationRecord
  belongs_to :citizen
  has_one :winner, dependent: :destroy



  validates :company_idno, :nr_bon_fiscal, :price, :company, :data_el, :presence => { :message => "Câmpul este obligatoriu."}
  validates :company_idno, :length => { :minimum => 13, :message => "Numărul minim de cifre este 13 pentru câmpul dat." }
  validates :company_idno, :nr_bon_fiscal, :price, :numericality => { :message => "Introduceți doar cifre." }
end
