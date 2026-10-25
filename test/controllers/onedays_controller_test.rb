require "test_helper"

class OnedaysControllerTest < ActionDispatch::IntegrationTest
  test "calendar index renders date links and real day classes" do
    posts(:one).update_columns(start_time: Time.utc(2024, 11, 13))
    memos(:one).update_columns(created_at: Time.utc(2024, 11, 13, 23, 59, 59))
    get onedays_url, params: { start_date: "2024-11-13" }
    assert_response :success
    assert_select "h1", "記録一覧ページ"
    assert_select "td.day_calendar.wday-3"
    link = one_days_concrete_path(date: "2024-11-13")
    assert_select "a[href=?]", link
    cell = css_select("td.day_calendar").find { |node| node.at_css("a[href='#{link}']") }
    assert_equal [ "1", "1", "1" ], cell.css("table tbody tr td").map { |node| node.text.strip }
  end

  test "date detail includes only records for the selected day" do
    date = Date.new(2024, 11, 13)
    posts(:one).update_columns(title: "selected task", start_time: Time.utc(2024, 11, 13))
    posts(:two).update_columns(title: "other task", start_time: Time.utc(2024, 11, 14))
    memos(:one).update_columns(title: "selected memo", created_at: Time.utc(2024, 11, 13, 23, 59, 59))
    memos(:two).update_columns(title: "other memo", created_at: Time.utc(2024, 11, 12, 23, 59, 59))
    one_diaries(:one).update_columns(title: "selected diary", date: date)
    one_diaries(:two).update_columns(title: "other diary", date: date.next_day)
    get one_days_concrete_url, params: { date: date.iso8601 }
    assert_response :success
    %w[task memo diary].each do |kind|
      assert_includes response.body, "selected #{kind}"
      assert_not_includes response.body, "other #{kind}"
    end
  end

  test "invalid or missing dates return bad request" do
    [ nil, "not-a-date", "2024-02-30" ].each do |date|
      get one_days_concrete_url, params: { date: date }
      assert_response :bad_request
    end
  end
  test "calendar navigation treats untrusted URL options as query data" do
    [
      { host: "untrusted.invalid", protocol: "https" },
      { original_script_name: "javascript:alert(1)//" },
      { use_route: "nonexistent_route" }
    ].each do |query|
      get onedays_url, params: query.merge(start_date: "2024-11-13")
      assert_response :success
      links = css_select(".calendar-heading a")
      assert_equal 2, links.length
      links.each do |link|
        uri = URI.parse(link["href"])
        assert_nil uri.host
        assert_nil uri.scheme
        assert_equal onedays_path, uri.path
        assert_includes URI.decode_www_form(uri.query).to_h, "start_date"
      end
    end
  end
end
