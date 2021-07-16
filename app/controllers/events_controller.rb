class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  private
  def event_parameter
    params.require(:event).permit(:theatername, :startday, :daynight, :event_comedian_id)
  end
end