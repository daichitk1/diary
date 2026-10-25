require "application_system_test_case"

class OneDiariesTest < ApplicationSystemTestCase
  setup do
    @record = one_diaries(:one)
  end

  test "visiting the index" do
    visit one_diaries_url
    assert_selector "h1", text: "日記一覧"
  end

  test "create record through the existing Japanese form" do
    visit one_diaries_url
    click_on "新規作成"
    fill_in "one_diary_title", with: "system created"
    fill_in "one_diary_content", with: "synthetic content"
    fill_in "one_diary_date", with: Date.new(2024, 11, 15)
    assert_field "one_diary_date", with: "2024-11-15"
    click_on "決定"
    assert_text "日記の作成に成功しました"
    assert_text "system created"
  end

  test "update record through the existing Japanese form" do
    visit one_diary_url(@record)
    click_on "編集", match: :first
    fill_in "one_diary_title", with: "system updated"
    click_on "決定"
    assert_text "日記の更新に成功しました"
    assert_text "system updated"
  end

  test "destroy record through confirmation" do
    visit one_diary_url(@record)
    accept_confirm { click_on "削除", match: :first }
    assert_text "日記が削除されました"
    assert_not OneDiary.exists?(@record.id)
  end
  test "duplicate date displays errors and a valid retry succeeds" do
    visit new_one_diary_url
    fill_in "one_diary_title", with: "duplicate browser date"
    fill_in "one_diary_content", with: "synthetic content"
    fill_in "one_diary_date", with: @record.date
    assert_field "one_diary_date", with: @record.date.iso8601
    click_on "決定"
    assert_text "prohibited this one_diary"
    fill_in "one_diary_date", with: Date.new(2024, 11, 15)
    assert_field "one_diary_date", with: "2024-11-15"
    click_on "決定"
    assert_text "日記の作成に成功しました"
    assert_text "duplicate browser date"
  end
end
