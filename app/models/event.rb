class Event < ApplicationRecord
  #メモ機能の修正時にアソシエーションを直す
  has_many :memos
  has_many :reaction_likes
  has_many :event_comedians

  # mapメソッドにより各レコードごとの芸人名を配列に格納する
  def comedians
    event_comedians.map(&:comedian)
  end
end
