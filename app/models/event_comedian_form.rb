class EventComedianForm
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :theater_id, :daynight_id, :start_time, :comedian_id, :comedian_ids
  with_options presence: true do
    validates :theater_id
    validates :daynight_id
    validates :start_time
  end

  def save(comedians)
    event = Event.create(theater_id: theater_id, daynight_id: daynight_id, start_time: start_time)
    i = 0
    comedians.each do |comedians|
      EventComedian.create(event_id: event.id, comedian_id: comedian_ids[i])
      i += 1
    end
  end

  #def update(comedians)
  #end
end