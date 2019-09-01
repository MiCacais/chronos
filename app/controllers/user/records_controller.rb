class User::RecordsController < User::DashboardController
  before_action :set_record

  def index
    @records = Record.where(user_id: @currentUser)
  end

  def new
  end

  def edit
  end

  def update
    if @record.update(time: params_time)
        redirect_to user_path, notice: 'Successfully registered!'
    else
        render :edit
    end
  end

  def set_record
    @record = Record.find(params[:id])
  end

  def params_time
    @time_params = params[:date] + params[:time]
  end
end
