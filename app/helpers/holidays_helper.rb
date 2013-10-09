module HolidaysHelper
  
  def render_holiday_tooltip(holiday)
    @cached_label_author ||= l(:field_author)
    @cached_label_holiday_mark ||= l(:field_mark)
    @cached_label_start_date ||= l(:holiday_field_start_date)
    @cached_label_due_date ||= l(:holiday_field_due_date)

    "<strong>#{@cached_label_author}</strong>: #{link_to_user holiday.author}<br />".html_safe +
    "<strong>#{@cached_label_start_date}</strong>: #{format_date(holiday.start_date)} #{format_time(holiday.start_time,false)} <br />".html_safe +
    "<strong>#{@cached_label_due_date}</strong>: #{format_date(holiday.due_date)} #{format_time(holiday.due_time,false)}<br />".html_safe  +
    "<strong>#{@cached_label_holiday_mark}</strong>: #{simple_format holiday.mark}<br />".html_safe

  end
end
