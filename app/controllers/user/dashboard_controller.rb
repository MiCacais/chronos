class User::DashboardController < ApplicationController

  before_action :authenticate_user!

  def index
    @currentUser = current_user.id
    @records = Record.where(user_id: @currentUser)
    @record = Record.new
  end

  def destroy
    @record_d = Record.find(params[:id])
    if @record_d.destroy
      redirect_to user_path, notice: 'Successfully deleted!'
    end
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(params_register)
    if @record.save user_records_path
      redirect_to user_path, notice: 'Successfully registered!'
    end
  end

  def params_register
    @register_params = params.require(:record).permit(:time)
  end
end
