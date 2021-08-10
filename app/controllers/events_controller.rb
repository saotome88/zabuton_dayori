class EventsController < ApplicationController
  def index
    @events = Event.all
    @reaction_like = ReactionLike.new
  end

  def show
    @events = Event.all
    @show = Event.find(params[:id])
    # 対象の日付の全ての演芸場のデータを取得する
    @shows = Event.where(start_time: @show.start_time)
    @reaction_like = ReactionLike.new
  end
end