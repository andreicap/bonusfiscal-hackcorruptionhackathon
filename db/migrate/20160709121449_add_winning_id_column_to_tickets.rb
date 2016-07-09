class AddWinningIdColumnToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :winning_id, :string
  end
end
