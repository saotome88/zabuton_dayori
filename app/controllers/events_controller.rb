class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  private
  def event_parameter
    params.permit(:event).permit(:theatername, :startday, :daynight, :comeddian_id)
  end
end