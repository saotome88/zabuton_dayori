class Admin::EventsController < ApplicationController
  #管理者ユーザー以外でアクションをしようとするとトップページに遷移する
  before_action :if_not_admin
  #before_action :basic_auth

  #管理者だけにさせたいアクションはここに記述する！
  def new
    @event = EventComedianForm.new
  end

  def create
    @event = EventComedianForm.new(event_params)
    comedians = params[:event_comedian_form][:comedian_ids]
    if @event.valid?
      @event.save(comedians)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  #def update
  #  @event = EventComedianForm.new(event_update_params)
  #  comedians = params[:event_comedian_form][:comedian_ids]
  #  binding.pry
  #  if @event.valid?
  #    @event.update(comedians)
  #    redirect_to event_path(event.id)
  #  else
  #    render 'edit'
  #  end
  #end
#
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

  #def basic_auth
   # authenticate_or_request_with_http_basic do |username, password|
    #  username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    #end
  #end

  def event_params
    params.require(:event_comedian_form).permit(:theater_id, :start_time, :daynight_id, comedian_ids: [])
  end

  def event_update_params
    params.require(:event_comedian_form).permit(:theater_id, :start_time, :daynight_id, comedian_ids: []).merge(event_id: params[:id])
  end
end
