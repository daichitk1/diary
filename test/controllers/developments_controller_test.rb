require "test_helper"

class DevelopmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @development = developments(:one)
  end

  test "should get index" do
    get developments_url
    assert_response :success
  end

  test "should get new" do
    get new_development_url
    assert_response :success
  end

  test "should create development" do
    assert_difference("Development.count") do
      post developments_url, params: { development: { content: @development.content, title: @development.title } }
    end

    assert_redirected_to development_url(Development.last)
  end

  test "should show development" do
    get development_url(@development)
    assert_response :success
  end

  test "should get edit" do
    get edit_development_url(@development)
    assert_response :success
  end

  test "should update development" do
    patch development_url(@development), params: { development: { content: @development.content, title: @development.title } }
    assert_redirected_to development_url(@development)
  end

  test "should destroy development" do
    assert_difference("Development.count", -1) do
      delete development_url(@development)
    end

    assert_redirected_to developments_url
  end
end
