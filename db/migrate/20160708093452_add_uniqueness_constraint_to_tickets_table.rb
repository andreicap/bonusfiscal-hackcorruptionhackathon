class AddUniquenessConstraintToTicketsTable < ActiveRecord::Migration[5.0]
  def change
    add_index :tickets, [:company_idno, :nr_bon_fiscal, :data_el], :unique => true
  end
end
