class AddMccToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :company_mcc, :string
  end
end
