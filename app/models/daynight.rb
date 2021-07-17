class Daynight < ActiveHash::Base
  include ActiveHash::Associations
  has_many :events

  self.data = [
    { id: 0, name: '' },
    { id: 1, name: '昼' },
    { id: 2, name: '夜' }
]
end