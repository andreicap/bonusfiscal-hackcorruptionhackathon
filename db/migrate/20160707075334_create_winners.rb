class CreateWinners < ActiveRecord::Migration[5.0]
  def change
    create_table :winners do |t|
      t.integer :ticket_id
      t.timestamps
    end
  end
end
