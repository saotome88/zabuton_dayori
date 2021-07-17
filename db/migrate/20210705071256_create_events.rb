class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.timestamps
      t.integer  :theater_id,              null: false
      t.date     :startday,                null: false
      t.integer  :daynight_id,             null: false
    end
  end
end