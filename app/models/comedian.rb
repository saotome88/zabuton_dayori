class Comedian < ActiveHash::Base
  include ActiveHash::Associations
  has_many :event_comedians
  has_many :events, through: :event_comedians

  self.data = [
    { id: 0, name: '' },
    { id: 1, name: '春風亭　あああ' },
    { id: 2, name: '柳家　いいい' },
    { id: 3, name: '橘　ううう' },
    { id: 4, name: '桂　えええ' },
    { id: 5, name: '三遊亭　おおお' },
    { id: 6, name: '神田　かかか' }
  ]
end