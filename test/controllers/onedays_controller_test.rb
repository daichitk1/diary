require "test_helper"

class OnedaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oneday = onedays(:one)
  end

  test "should get index" do
    get onedays_url
    assert_response :success
  end

  test "should get new" do
    get new_oneday_url
    assert_response :success
  end

  test "should create oneday" do
    assert_difference("Oneday.count") do
      post onedays_url, params: { oneday: {} }
    end

    assert_redirected_to oneday_url(Oneday.last)
  end

  test "should show oneday" do
    get oneday_url(@oneday)
    assert_response :success
  end

  test "should get edit" do
    get edit_oneday_url(@oneday)
    assert_response :success
  end

  test "should update oneday" do
    patch oneday_url(@oneday), params: { oneday: {} }
    assert_redirected_to oneday_url(@oneday)
  end

  test "should destroy oneday" do
    assert_difference("Oneday.count", -1) do
      delete oneday_url(@oneday)
    end

    assert_redirected_to onedays_url
  end
end
