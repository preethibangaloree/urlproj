require "application_system_test_case"

class UrllsTest < ApplicationSystemTestCase
  setup do
    @urll = urlls(:one)
  end

  test "visiting the index" do
    visit urlls_url
    assert_selector "h1", text: "Urlls"
  end

  test "should create urll" do
    visit urlls_url
    click_on "New urll"

    fill_in "Long url", with: @urll.long_url
    fill_in "Short url", with: @urll.short_url
    click_on "Create Urll"

    assert_text "Urll was successfully created"
    click_on "Back"
  end

  test "should update Urll" do
    visit urll_url(@urll)
    click_on "Edit this urll", match: :first

    fill_in "Long url", with: @urll.long_url
    fill_in "Short url", with: @urll.short_url
    click_on "Update Urll"

    assert_text "Urll was successfully updated"
    click_on "Back"
  end

  test "should destroy Urll" do
    visit urll_url(@urll)
    click_on "Destroy this urll", match: :first

    assert_text "Urll was successfully destroyed"
  end
end
