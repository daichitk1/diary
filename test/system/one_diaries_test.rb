require "application_system_test_case"

class OneDiariesTest < ApplicationSystemTestCase
  setup do
    @one_diary = one_diaries(:one)
  end

  test "visiting the index" do
    visit one_diaries_url
    assert_selector "h1", text: "One diaries"
  end

  test "should create one diary" do
    visit one_diaries_url
    click_on "New one diary"

    fill_in "Content", with: @one_diary.content
    fill_in "Date", with: @one_diary.date
    fill_in "Title", with: @one_diary.title
    click_on "Create One diary"

    assert_text "One diary was successfully created"
    click_on "Back"
  end

  test "should update One diary" do
    visit one_diary_url(@one_diary)
    click_on "Edit this one diary", match: :first

    fill_in "Content", with: @one_diary.content
    fill_in "Date", with: @one_diary.date
    fill_in "Title", with: @one_diary.title
    click_on "Update One diary"

    assert_text "One diary was successfully updated"
    click_on "Back"
  end

  test "should destroy One diary" do
    visit one_diary_url(@one_diary)
    click_on "Destroy this one diary", match: :first

    assert_text "One diary was successfully destroyed"
  end
end
