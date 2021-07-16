class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.timestamps
      t.string  :theatername,              null: false, default: ""
      t.date    :startday,                 null: false
      t.string  :daynaight,                null: false, default: ""
      t.integer :event_comedian_id,        null: false
    end
  end
end