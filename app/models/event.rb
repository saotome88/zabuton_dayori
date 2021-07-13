class Event < ApplicationRecord
  has_many :reaction_likes
  has_many :users, through: :reaction_likes
  has_many :event_comedians
  has_many :comedians, through: :event_comedians

  # mapメソッドにより各レコードごとの芸人名を配列に格納する
  def comedians
    event_comedians.map(&:comedian)
  end
end
