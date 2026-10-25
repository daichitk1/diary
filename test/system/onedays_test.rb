require "application_system_test_case"

class OnedaysTest < ApplicationSystemTestCase
  test "calendar navigates to the selected day and back" do
    visit onedays_url(start_date: "2024-11-13")
    assert_selector "h1", text: "記録一覧ページ"
    find("a[href='#{one_days_concrete_path(date: '2024-11-13')}']", match: :first).click
    assert_selector "h1", text: "2024-11-13の記録"
    click_on "記録一覧ページ", match: :first
    assert_selector "h1", text: "記録一覧ページ"
  end
  test "month navigation preserves calendar rendering across Turbo visits" do
    visit onedays_url(start_date: "2024-11-13")
    click_on "来月", match: :first
    assert_selector ".calendar-title", text: "December 2024"
    assert_selector "td.day_calendar a[href='#{one_days_concrete_path(date: '2024-12-01')}']"
    click_on "先月", match: :first
    assert_selector ".calendar-title", text: "November 2024"
  end
end
