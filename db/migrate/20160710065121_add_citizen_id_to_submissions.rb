class AddCitizenIdToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :citizen_id, :integer
  end
end
