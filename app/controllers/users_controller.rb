class UsersController < ApplicationController
  before_action :authenticate

  def show
    @user = User.where(id: current_user).first

    @events_owner = Event.where(owner_id: current_user).where(Event.arel_table[:start_time].gteq Time.zone.now).order(:start_time)

    @events_part = Event.where(Event.arel_table[:start_time].gteq Time.zone.now).joins(:tickets).merge(Ticket.where(user_id: current_user)).order(:start_time)
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
