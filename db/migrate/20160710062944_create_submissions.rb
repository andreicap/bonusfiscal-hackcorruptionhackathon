class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :institution_name
      t.string :city
      t.string :address
      t.string :description
      t.timestamps
    end
  end
end
