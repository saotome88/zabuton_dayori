class EventComedian < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :comedian
  belongs_to :event
end
