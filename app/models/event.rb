class Event < ApplicationRecord
  has_many :memos
  has_many :reaction_likes
end
