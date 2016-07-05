class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :company_idno
      t.string :nr_bon_fiscal
      t.string :price,    default: ""
      t.string :company,  default: ""
      t.timestamps
    end
  end
end
