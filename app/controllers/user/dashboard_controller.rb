class User::DashboardController < ApplicationController

  layout "dashboard"

  before_action :authenticate_user!

  def index
    @currentUser = current_user.id
    @records = Record.where(user_id: @currentUser)
    @record = Record.new
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(
      time: Time.now,
      user_id: current_user.id
    )
    if @record.save
      redirect_to user_path, notice: 'Successfully registered!'
    end
  end

  def destroy
    @record_d = Record.find(params[:id])
    if @record_d.destroy
      redirect_to user_path, notice: 'Successfully deleted!'
    end
  end

  private
  def time_params
    params.require(:record).permit(:id, :time, :user_id)
  end
end
