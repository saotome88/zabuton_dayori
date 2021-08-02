class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  # passwordは半角英数字のバリデーション
  validates :encrypted_password, :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }

  has_many :events, through: :reaction_likes
  has_many :reaction_likes, dependent: :destroy
  # ユーザーがどの番組に「いいねをした」かを取得する
  has_many :liked_events, through: :likes, source: :event

  # ユーザーがすでにいいねをしているかどうかの判定をする。
  def already_liked?(event)
    self.likes.exists?(event_id: event.id)
  end
end
