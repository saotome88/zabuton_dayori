class ReactionLike < ApplicationRecord
  belongs_to :user
  belongs_to :event
  #memoがネスト構造になるかも？
end
