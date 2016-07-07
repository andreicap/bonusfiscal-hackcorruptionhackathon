class Ticket < ApplicationRecord
  belongs_to :citizen


  validates :company_idno, :nr_bon_fiscal, :price, :company, :data_eliberarii, :presence => { :message => "Cîmpul este obligatoriu de completat"}
  validates :company_idno, :length => { :minimum => 13, :message => "Nr. minim de cifre este 13 pentru cîmpul dat" }
  validates :company_idno, :nr_bon_fiscal, :price, :numericality => { :message => "Introduceti doar numere" } 
end
