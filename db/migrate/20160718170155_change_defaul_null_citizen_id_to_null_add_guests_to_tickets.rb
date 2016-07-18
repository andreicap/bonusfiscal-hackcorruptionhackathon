class ChangeDefaulNullCitizenIdToNullAddGuestsToTickets < ActiveRecord::Migration[5.0]
  def change
    change_column :tickets, :citizen_id, :integer, default: nil
    add_column :tickets, :guest_id, :integer, default: nil
  end
end
