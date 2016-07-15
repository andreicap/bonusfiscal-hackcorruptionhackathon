class AddSubmissionIpToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :submission_ip, :string
  end
end
