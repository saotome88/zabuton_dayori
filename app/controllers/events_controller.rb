class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.find(1)
    @event_comedian = EventComedian.find(1)
  end

  private
  def event_parameter
    params.require(:event).permit(:theater_id, :startday, :daynight_id)
  end
end