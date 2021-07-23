class EventComedianForm
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :theater_id, :daynight_id, :startday, :comedian_id, :comedian_ids
  with_options presence: true do
    validates :theater_id
    validates :daynight_id
    validates :startday
  end

  def save(comedians)
    event = Event.create(theater_id: theater_id, daynight_id: daynight_id, startday: startday)
    i = 0
    comedians.each do |comedians|
      EventComedian.create(event_id: event.id, comedian_id: comedian_ids[i])
      i += 1
    end
  end

end