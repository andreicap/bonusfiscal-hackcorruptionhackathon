class AddDateColumnToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :data_eliberarii, :date
  end
end
