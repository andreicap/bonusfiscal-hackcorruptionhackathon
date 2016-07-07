class Ticket < ApplicationRecord
  belongs_to :citizen


  validates :company_idno, :nr_bon_fiscal, :price, :company, :data_eliberarii, :presence => { :message => "Câmpul este obligatoriu de completat"}
  validates :company_idno, :length => { :minimum => 13, :message => "Numărul minim de cifre este 13 pentru câmpul dat" }
  validates :company_idno, :nr_bon_fiscal, :price, :numericality => { :message => "Introduceți doar cifre" } 
end
