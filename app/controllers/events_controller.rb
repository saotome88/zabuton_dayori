class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @events = Event.all
    @show = Event.find(params[:id])
    # 昼席と夜席の二つのデータを取得する
    @shows = Event.where(start_time: @show.start_time, theater_id: @show.theater_id)
  end
end