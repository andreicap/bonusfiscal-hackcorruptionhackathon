class AddConfirmableToDeviseCitizen < ActiveRecord::Migration[5.0]
  def up
    add_column :citizens, :confirmation_token, :string
    add_column :citizens, :confirmed_at, :datetime
    add_column :citizens, :confirmation_sent_at, :datetime
    add_column :citizens, :name, :string
    add_column :citizens, :surname, :string
    # add_column :citizens, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :citizens, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # citizens as confirmed, do the following
    execute("UPDATE citizens SET confirmed_at = NOW()")
    add_column :citizens, :unconfirmed_email, :string
    # All existing user accounts should be able to log in after this.
    # Remind: Rails using SQLite as default. And SQLite has no such function :NOW.
    # Use :date('now') instead of :NOW when using SQLite.
    # => execute("UPDATE citizens SET confirmed_at = date('now')")
    # Or => User.all.update_all confirmed_at: Time.now
  end

  def down
    remove_columns :citizens, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :citizens, :unconfirmed_email # Only if using reconfirmable
  end
end
