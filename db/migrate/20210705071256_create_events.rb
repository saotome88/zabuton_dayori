class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.timestamps
      t.string  :theatername,              null: false, default: ""
      t.date    :startday,                 null: false
      t.string  :daynaight,                null: false, default: ""
    end
  end
end