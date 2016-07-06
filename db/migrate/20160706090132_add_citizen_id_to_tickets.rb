class AddCitizenIdToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :citizen_id, :integer
  end
end
