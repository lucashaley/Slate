require "test_helper"

class RealmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @realm = realms(:one)
  end

  test "should get index" do
    get realms_url
    assert_response :success
  end

  test "should get new" do
    get new_realm_url
    assert_response :success
  end

  test "should create realm" do
    assert_difference("Realm.count") do
      post realms_url, params: { realm: { color: @realm.color, title: @realm.title } }
    end

    assert_redirected_to realm_url(Realm.last)
  end

  test "should show realm" do
    get realm_url(@realm)
    assert_response :success
  end

  test "should get edit" do
    get edit_realm_url(@realm)
    assert_response :success
  end

  test "should update realm" do
    patch realm_url(@realm), params: { realm: { color: @realm.color, title: @realm.title } }
    assert_redirected_to realm_url(@realm)
  end

  test "should destroy realm" do
    assert_difference("Realm.count", -1) do
      delete realm_url(@realm)
    end

    assert_redirected_to realms_url
  end
end
