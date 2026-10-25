require "application_system_test_case"

class MemosTest < ApplicationSystemTestCase
  setup do
    @record = memos(:one)
  end

  test "visiting the index" do
    visit memos_url
    assert_selector "h1", text: "メモ一覧"
  end

  test "create record through the existing Japanese form" do
    visit memos_url
    click_on "新規メモ"
    fill_in "memo_title", with: "system created"
    fill_in "memo_content", with: "synthetic content"
    click_on "決定"
    assert_text "メモの作成に成功しました"
    assert_text "system created"
  end

  test "update record through the existing Japanese form" do
    visit memo_url(@record)
    click_on "メモ編集", match: :first
    fill_in "memo_title", with: "system updated"
    click_on "決定"
    assert_text "メモの更新に成功しました"
    assert_text "system updated"
  end

  test "destroy record through confirmation" do
    visit memo_url(@record)
    accept_confirm { click_on "削除", match: :first }
    assert_text "メモの削除に成功しました"
    assert_not Memo.exists?(@record.id)
  end
end
