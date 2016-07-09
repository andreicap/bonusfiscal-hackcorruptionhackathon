class AddTicketCategoryToTicketsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :ticket_category, :string
  end
end
