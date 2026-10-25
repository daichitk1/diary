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
end
