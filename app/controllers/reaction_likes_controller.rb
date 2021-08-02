class ReactionLikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @event = Event.find(params[:event_id])
    @reaction_like = ReactionLike.create(event_id: params[:event_id], user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # findメソッドはidを引数に取る。find_byメソッドは属性を取り、複数条件を指定できる。
    @reaction_like = ReactionLike.find_by(event_id: params[:event_id], user_id: current_user.id)
    @reaction_like.destroy
    #直前のぺージにリダイレクトする。いいねを消したら、トップページをリダイレクトして反映させている
    redirect_back(fallback_location: root_path)
  end

  private
    def reaction_like_params
      params.require(:reaction_like).permit(:event_id, :user_id)
    end
end