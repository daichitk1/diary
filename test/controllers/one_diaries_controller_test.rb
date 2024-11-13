require "test_helper"

class OneDiariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @one_diary = one_diaries(:one)
  end

  test "should get index" do
    get one_diaries_url
    assert_response :success
  end

  test "should get new" do
    get new_one_diary_url
    assert_response :success
  end

  test "should create one_diary" do
    assert_difference("OneDiary.count") do
      post one_diaries_url, params: { one_diary: { content: @one_diary.content, date: @one_diary.date, title: @one_diary.title } }
    end

    assert_redirected_to one_diary_url(OneDiary.last)
  end

  test "should show one_diary" do
    get one_diary_url(@one_diary)
    assert_response :success
  end

  test "should get edit" do
    get edit_one_diary_url(@one_diary)
    assert_response :success
  end

  test "should update one_diary" do
    patch one_diary_url(@one_diary), params: { one_diary: { content: @one_diary.content, date: @one_diary.date, title: @one_diary.title } }
    assert_redirected_to one_diary_url(@one_diary)
  end

  test "should destroy one_diary" do
    assert_difference("OneDiary.count", -1) do
      delete one_diary_url(@one_diary)
    end

    assert_redirected_to one_diaries_url
  end
end
