require "test_helper"

class UrllsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @urll = urlls(:one)
  end

  test "should get index" do
    get urlls_url
    assert_response :success
  end

  test "should get new" do
    get new_urll_url
    assert_response :success
  end

  test "should create urll" do
    assert_difference("Urll.count") do
      post urlls_url, params: { urll: { long_url: @urll.long_url, short_url: @urll.short_url } }
    end

    assert_redirected_to urll_url(Urll.last)
  end

  test "should show urll" do
    get urll_url(@urll)
    assert_response :success
  end

  test "should get edit" do
    get edit_urll_url(@urll)
    assert_response :success
  end

  test "should update urll" do
    patch urll_url(@urll), params: { urll: { long_url: @urll.long_url, short_url: @urll.short_url } }
    assert_redirected_to urll_url(@urll)
  end

  test "should destroy urll" do
    assert_difference("Urll.count", -1) do
      delete urll_url(@urll)
    end

    assert_redirected_to urlls_url
  end
end
