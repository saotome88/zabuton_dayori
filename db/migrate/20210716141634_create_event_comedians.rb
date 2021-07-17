class CreateEventComedians < ActiveRecord::Migration[6.0]
  def change
    create_table :event_comedians do |t|
      t.timestamps
      t.references :event,           null: false, foreign_key: true
      t.integer    :comedian_id,     null: false
    end
  end
end
