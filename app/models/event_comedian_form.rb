class EventComedianForm
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :theater_id, :daynight_id, :startday, :comedian_id

  with_options presence: true do
    validates :theater_id
    validates :daynight_id
    validates :startday
    validates :comedian_id
  end

  def save
    event = Event.create(theater_id: theater_id, daynight_id: daynight_id, startday: startday)
    EventComedian.create(event_id: event.id, comedian_id: comedian_id) 
  end

end