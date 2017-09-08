class CalendarController < ApplicationController
  before_action :sign_in_required
  def index
      @schedule = Schedule.new
      @ws = []
      s = view_context.weather.dig("description", "text").split("。")
      @ws = s.to_a

      if @date.nil?
        @date = Date.today
      end
      @arr =   Calendar.create_calendar(@date, current_user)


  end

  def show

      @tmp = Schedule.find(params[:id])
  end

  def edit
      @tmp = Schedule.find_by(id: params[:id])
  end

  def update
      @tmp = Schedule.find(params[:id])
      if @tmp.update_attributes(edit_params)
      flash[:success] = "OK!"
      redirect_to(calendar_index_path)
      
      else
      flash[:warning] = "Edit faild"
        redirect_to(calendar_path)
      end  
  end


  def next
      @arr = []
      @schedule = Schedule.new
      @ws = []
      s = view_context.weather.dig("description", "text").split("。")
      @ws = s.to_a
      if (params[:month].to_i == 12)
          
          @date = Date.new(params[:year].to_i + 1, params[:month].to_i - 11, 1)
      
      else

          @date = Date.new(params[:year].to_i, params[:month].to_i + 1, 1)
      end
      @arr = Calendar.create_calendar(@date, current_user)

      render template: "/calendar/index"
  end


  def destroy
      Schedule.find(params[:id]).destroy
      flash[:success] = "Task deleted"
      redirect_to calendar_index_url
  end

  def create
      text = "遅刻します！"

      Slack.chat_postMessage(text: text,name: "jon", channel: "#general")

      flash[:success] = "message send"
      redirect_to calendar_index_url
  end

  def previous
      @arr = []
      @schedule = Schedule.new
      @ws = []
      s = view_context.weather.dig("description", "text").split("。")
      @ws = s.to_a

      if (params[:month].to_i == 1)
          @date = Date.new(params[:year].to_i - 1, params[:month].to_i + 11, 1)
      else
          @date = Date.new(params[:year].to_i, params[:month].to_i - 1, 1)
      end

      @arr = Calendar.create_calendar(@date, current_user)

      render template: "/calendar/index"

  end

  private
    def edit_params
      params.require(:schedule).permit(:title, :body)
    end


end
