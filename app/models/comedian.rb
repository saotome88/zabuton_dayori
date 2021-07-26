class Comedian < ActiveHash::Base
  include ActiveHash::Associations
  has_many :event_comedians
  has_many :events, through: :event_comedians

  self.data = [
    { id: 0, name: '' },
    { id: 1, name: '春風亭　太郎' },
    { id: 2, name: '柳家　次郎' },
    { id: 3, name: '橘　三郎' },
    { id: 4, name: '桂　四郎' },
    { id: 5, name: '三遊亭　五郎' },
    { id: 6, name: '神田　六郎' },
    { id: 7, name: '笑福亭　七郎' },
    { id: 8, name: '柳亭　八郎' },
    { id: 9, name: '五街道　九郎' },
    { id: 10, name: '桃月　十郎' }
  ]
end