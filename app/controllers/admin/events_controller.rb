class Admin::EventsController < ApplicationController
  #管理者ユーザー以外でアクションをしようとするとトップページに遷移する
  before_action :if_not_admin


  #管理者だけにさせたいアクションは以下に記述する！
  def new
    @event = EventComedianForm.new
  end

  def create
    @event = EventComedianForm.new(event_params)
    # 複数日付登録用の変数start_timesを作成
    #start_times = params[:event_comedian_form][:start_times]
    comedians = params[:event_comedian_form][:comedian_ids]
    if @event.valid?
      @event.save(comedians)
      #@event.save(comedians, start_times)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end
#
#  def update
#    @event = Event.find(params[:id])
#    comedians = params[:event_comedian_form][:comedian_ids]
#    binding.pry
#    if @event.valid?
#      @event.update(comedians)
#      redirect_to event_path(event.id)
#    else
#    render 'edit'
#    end
#  end

  #def destroy
  #  event = EventComedianForm.find(params[:id])
  #  event.destroy
  #end

  private
  def if_not_admin
    if user_signed_in?
      if current_user.admin != true
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def event_params
    params.require(:event_comedian_form).permit(:theater_id, :start_time, :daynight_id, comedian_ids: [])
#    params.require(:event_comedian_form).permit(:theater_id, start_times: [], :daynight_id, comedian_ids: [])
  end

  def event_update_params
    params.require(:event_comedian_form).permit(:theater_id, :start_time, :daynight_id, comedian_ids: [], event_id: params[:id])
  end
end
