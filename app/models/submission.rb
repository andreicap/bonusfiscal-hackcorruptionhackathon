class Submission < ApplicationRecord
	validates :institution_name, :city, :address, :description, :length => { :minimum => 5, :message => "Numărul minim de caractere este 5 pentru câmpul dat" }
end
