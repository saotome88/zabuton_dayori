class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.timestamps
      t.text        :text,           null: false
      t.references  :reaction_like,  null: false, foreign_key: true
    end
  end
end