class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|

      t.timestamps
      t.references :user,     foreign_key: true
      t.references :event,    foreign_key: true
      t.text       :text,     null: false
    end
  end
end