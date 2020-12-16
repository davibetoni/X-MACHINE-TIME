class CreateMaachines < ActiveRecord::Migration[6.1]
  def change
    create_table :maachines do |t|
      t.integer :maachine_id

      t.timestamps
    end
  end
end
