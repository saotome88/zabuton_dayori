class CreateReactionLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :reaction_likes do |t|
      t.timestamps
      t.references :user,   foreign_key: true
      t.references :event,  foreign_key: true
    end
  end
end
