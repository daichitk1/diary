require "test_helper"

class CalendarHelperTest < ActionView::TestCase
  include SimpleCalendar::ViewHelpers

  test "default calendar template renders day classes" do
    params[:controller] = "onedays"
    params[:action] = "index"
    html = calendar(start_date: Date.new(2024, 11, 13)) { |day| day.day.to_s }
    assert_includes html, "day_calendar"
    assert_includes html, "wday-"
  end
end
