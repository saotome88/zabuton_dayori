class Admin::EventsController < ApplicationController
  #管理者ユーザー以外でアクションをしようとするとトップページに遷移する
  before_action :if_not_admin

  #管理者だけにさせたいアクションはここに記述する！
  def new
    @event = EventComedianForm.new
  end

  def create
    @event = EventComedianForm.new(event_params)
    if @event.valid?
      @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

#  def destroy
#    event = EventComedianForm.find(params[:id])
#    event.destroy
#  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def event_params
    params.require(:event_comedian_form).permit(:theater_id, :startday, :daynight_id, :comedian_id)
  end
end
