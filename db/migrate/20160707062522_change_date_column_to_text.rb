class ChangeDateColumnToText < ActiveRecord::Migration[5.0]
	def change
		change_table :tickets do |t|
			t.change :data_eliberarii,	:string
		end
	end
end
