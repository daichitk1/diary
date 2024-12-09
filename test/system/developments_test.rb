require "application_system_test_case"

class DevelopmentsTest < ApplicationSystemTestCase
  setup do
    @development = developments(:one)
  end

  test "visiting the index" do
    visit developments_url
    assert_selector "h1", text: "Developments"
  end

  test "should create development" do
    visit developments_url
    click_on "New development"

    fill_in "Content", with: @development.content
    fill_in "Title", with: @development.title
    click_on "Create Development"

    assert_text "Development was successfully created"
    click_on "Back"
  end

  test "should update Development" do
    visit development_url(@development)
    click_on "Edit this development", match: :first

    fill_in "Content", with: @development.content
    fill_in "Title", with: @development.title
    click_on "Update Development"

    assert_text "Development was successfully updated"
    click_on "Back"
  end

  test "should destroy Development" do
    visit development_url(@development)
    click_on "Destroy this development", match: :first

    assert_text "Development was successfully destroyed"
  end
end
