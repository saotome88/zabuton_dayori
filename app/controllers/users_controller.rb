class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @reaacton_like = ReactionLike.new
    @memo = Memo.new
  end
end
