class CreateInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :infos do |t|
      t.integer :machine_id
      t.integer :video_sequence
      t.string :file_compression
      t.string :file_type
      t.string :file_name
      t.integer :video_length
      t.string :status
      t.string :event_name
      t.string :event_date
      t.string :contact_name
      t.references :event, null: false, foreign_key: true
      t.references :filee, null: false, foreign_key: true
      t.references :maachine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
