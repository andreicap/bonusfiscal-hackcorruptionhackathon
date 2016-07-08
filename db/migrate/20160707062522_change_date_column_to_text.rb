class ChangeDateColumnToText < ActiveRecord::Migration[5.0]
	def change
		change_table :tickets do |t|
			t.change :data_el,	:string
		end
	end
end
