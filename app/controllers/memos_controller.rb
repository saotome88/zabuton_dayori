class MemosController < ApplicationController
  def create
    @memo = Memo.new(memo_params)
  end

  private
  def memo_params
    # event_idのmerge方法は後で追加記述
    params.require(:memo).permit(:text).merge(user_id: current_user.id)
  end
end
