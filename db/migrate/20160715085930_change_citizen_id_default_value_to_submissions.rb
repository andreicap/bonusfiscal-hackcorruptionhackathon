class ChangeCitizenIdDefaultValueToSubmissions < ActiveRecord::Migration[5.0]
  def change
    change_column :submissions, :citizen_id, :integer, :default => nil
  end
end
