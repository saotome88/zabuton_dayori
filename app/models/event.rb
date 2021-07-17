class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :reaction_likes
  has_many :users, through: :reaction_likes
  has_many :event_comedians
  has_many :comedians, through: :event_comedians
  belongs_to :theater
  belongs_to :daynight
end
