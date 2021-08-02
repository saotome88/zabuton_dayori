class MemosController < ApplicationController
  before_action :authenticate_user!

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.valid?
      @memo.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def memo_params
    params.require(:memo).permit(:text).merge(reaction_like_id: params[:reaction_like_id])
  end
end