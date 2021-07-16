class ReactionLike < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :memo
end
