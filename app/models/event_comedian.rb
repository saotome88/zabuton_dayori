class EventComedian < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :comedian
  belongs_to :event
end
