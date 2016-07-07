class Ticket < ApplicationRecord
  belongs_to :citizen

# TO DO: Add :data_eliberarii in 1 validation
  validates :company_idno, :nr_bon_fiscal, :price, :company, :presence => { :message => "Cîmpul este obligatoriu de completat"}
  validates :company_idno, :length => { :minimum => 13, :message => "Nr. minim de cifre este 13 pentru cîmpul dat" }
  validates :company_idno, :nr_bon_fiscal, :price, :numericality => { :message => "Introduceti doar numere" } 
end
