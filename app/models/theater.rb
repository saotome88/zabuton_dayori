class Theater < ActiveHash::Base
  include ActiveHash::Associations
  has_many :events

  self.data = [
    { id: 0, name: '' },
    { id: 1, name: '新宿末廣亭' },
    { id: 2, name: '池袋演芸場' }
    { id: 3, name: '浅草演芸ホール' }
    { id: 4, name: '上野鈴本' }
]
end