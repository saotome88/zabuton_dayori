class Comedian < ActiveHash::Base
  include ActiveHash::Associations
  has_many :event_comedians

  # mapメソッドにより各レコードごとのeventを配列に格納している
  def events
    event_comedians.map(&:event)
  end

  self.data = [
    { id: 1, name: '' },
    { id: 2, name '春風亭　あああ' },
    { id: 3, name '柳家　いいい' },
    { id: 4, name '橘　ううう' },
    { id: 5, name '桂　えええ' },
    { id: 6, name '三遊亭　おおお' },
    { id: 7, name '神田　かかか' }
]
end