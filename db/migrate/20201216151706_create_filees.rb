class CreateFilees < ActiveRecord::Migration[6.1]
  def change
    create_table :filees do |t|
      t.integer :position
      t.string :compression
      t.string :type
      t.string :name
      t.integer :length

      t.timestamps
    end
  end
end
