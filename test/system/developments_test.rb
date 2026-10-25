require "application_system_test_case"

class DevelopmentsTest < ApplicationSystemTestCase
  setup do
    @record = developments(:one)
  end

  test "visiting the index" do
    visit developments_url
    assert_selector "h1", text: "開発一覧"
  end

  test "create record through the existing Japanese form" do
    visit developments_url
    click_on "新規開発メモ"
    fill_in "development_title", with: "system created"
    fill_in "development_content", with: "synthetic content"
    click_on "決定"
    assert_text "開発の作成に成功しました"
    assert_text "system created"
  end

  test "update record through the existing Japanese form" do
    visit development_url(@record)
    click_on "編集", match: :first
    fill_in "development_title", with: "system updated"
    click_on "決定"
    assert_text "開発の更新に成功しました"
    assert_text "system updated"
  end

  test "destroy record through confirmation" do
    visit development_url(@record)
    accept_confirm { click_on "削除", match: :first }
    assert_text "開発の削除に成功しました"
    assert_not Development.exists?(@record.id)
  end
end
