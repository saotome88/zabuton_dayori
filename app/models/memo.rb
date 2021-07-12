class Memo < ApplicationRecord
  belongs_to :user
  #メモ機能の修正時にアソシエーションを直す
  belongs_to :event
end
