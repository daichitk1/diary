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
      post one_diaries_url, params: { one_diary: { content: @one_diary.content, date: Date.new(2024, 11, 15), title: @one_diary.title } }
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
  test "duplicate date returns validation errors and can be retried" do
    assert_no_difference("OneDiary.count") do
      post one_diaries_url, params: { one_diary: { title: "duplicate", content: "synthetic", date: @one_diary.date } }
    end
    assert_response :unprocessable_entity
    assert_select "form[action=?]", one_diaries_path
    assert_select "li", minimum: 1
    assert_difference("OneDiary.count", 1) do
      post one_diaries_url, params: { one_diary: { title: "retry", content: "synthetic", date: Date.new(2024, 11, 15) } }
    end
    assert_redirected_to one_diary_url(OneDiary.last)
  end
end
