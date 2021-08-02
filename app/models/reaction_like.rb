class ReactionLike < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates_uniqueness_of :event_id, scope: :user_id
  #memoがネスト構造になるかも？
end
