class Ticket < ApplicationRecord
  has_attachment :ticket_image
  belongs_to :citizen
  belongs_to :guest
  has_one :winner, dependent: :destroy
  before_save :titleing

  validates :company_idno, :company_mcc, :nr_bon_fiscal, :price, :company, :data_el, :presence => { :message => "Câmpul este obligatoriu"}
  validates :company_idno, :length => { :minimum => 13, :message => "Numărul minim de cifre este 13 pentru câmpul dat" }
  validates :company_idno, :nr_bon_fiscal, :price, :numericality => { :message => "Introduceți doar cifre" }
  validates :price, :numericality => {:greater_than_or_equal_to => 5, :message => "Prețul minim pentru bilet este 5 lei." }
  validate  :ticket_quota, :on => :create

  def titleing
    self.company = self.company.split.map(&:capitalize)*" "
  end

private

  def ticket_quota
    # Number of tickets is ct + 1
    ct = 0
    if self.citizen
      ct = citizen.tickets.where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now)).count
    end
    if ct > 4
      errors.add(:base, "Numărul de bonuri pentru astăzi a fost depășit.")
    end
  end

end
