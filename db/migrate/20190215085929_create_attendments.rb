class CreateAttendments < ActiveRecord::Migration[5.2]
  def change
    create_table :attendments do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
