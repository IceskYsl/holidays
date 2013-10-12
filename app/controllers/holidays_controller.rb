#encoding: utf-8
class HolidaysController < ApplicationController
  model_object Holiday
  unloadable
  helper :calendars
  include CalendarsHelper

  def index
    if params[:year] and params[:year].to_i > 1900
      @year = params[:year].to_i
      if params[:month] and params[:month].to_i > 0 and params[:month].to_i < 13
        @month = params[:month].to_i
      end
    end
    @year ||= Date.today.year
    @month ||= Date.today.month
    @calendar = Redmine::Helpers::Calendar.new(Date.civil(@year, @month, 1), current_language, :month)
    events = []
    # holidays_scope = Holiday.where("status = 0")
    holidays = Holiday.where("((start_date BETWEEN ? AND ?) OR (due_date BETWEEN ? AND ?))", @calendar.startdt, @calendar.enddt, @calendar.startdt, @calendar.enddt)
    events += holidays
    @calendar.events = events
  end
  
  def new
    @day = Date.today
    @holiday = Holiday.new()
  end
  
  def create
    @holiday = Holiday.new(params[:holiday])
    @holiday.author = User.current
    @holiday.save
    redirect_to holidays_path()
  end
  
end
