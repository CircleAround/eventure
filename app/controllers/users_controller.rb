class UsersController < ApplicationController
  before_action :authenticate

  def show
    @user = current_user

    @future_events_owner = current_user.created_events.after_now
    @past_events_owner = current_user.created_events.before_now

    @future_events_part = current_user.participating_events.after_now
    @past_events_part = current_user.participating_events.before_now
  end

  def event_owned
    @user = current_user
    @events_owned = current_user.created_events.after_now
  end

  def event_attend
    @user = current_user
    @events_attend = current_user.participating_events.after_now
  end

  def event_owned_past
    @user = current_user
    @events_owned_past = current_user.created_events.before_now
  end

  def event_attend_past
    @user = current_user
    @events_attend_past = current_user.participating_events.before_now
  end

  def retire
  end

  def destroy
    if current_user.destroy
      reset_session
      redirect_to root_path, notice: '退会完了しました'
    else
      render :retire
    end
  end
end
