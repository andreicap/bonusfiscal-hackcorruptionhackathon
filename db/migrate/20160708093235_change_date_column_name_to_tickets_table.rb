class ChangeDateColumnNameToTicketsTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :tickets, :data_eliberarii, :data_el
  end
end
