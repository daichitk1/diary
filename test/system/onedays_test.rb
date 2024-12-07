require "application_system_test_case"

class OnedaysTest < ApplicationSystemTestCase
  setup do
    @oneday = onedays(:one)
  end

  test "visiting the index" do
    visit onedays_url
    assert_selector "h1", text: "Onedays"
  end

  test "should create oneday" do
    visit onedays_url
    click_on "New oneday"

    click_on "Create Oneday"

    assert_text "Oneday was successfully created"
    click_on "Back"
  end

  test "should update Oneday" do
    visit oneday_url(@oneday)
    click_on "Edit this oneday", match: :first

    click_on "Update Oneday"

    assert_text "Oneday was successfully updated"
    click_on "Back"
  end

  test "should destroy Oneday" do
    visit oneday_url(@oneday)
    click_on "Destroy this oneday", match: :first

    assert_text "Oneday was successfully destroyed"
  end
end
