require "test_helper"

class CreateUser1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_user1 = create_user1s(:one)
  end

  test "should get index" do
    get create_user1s_url
    assert_response :success
  end

  test "should get new" do
    get new_create_user1_url
    assert_response :success
  end

  test "should create create_user1" do
    assert_difference("CreateUser1.count") do
      post create_user1s_url, params: { create_user1: {  } }
    end

    assert_redirected_to create_user1_url(CreateUser1.last)
  end

  test "should show create_user1" do
    get create_user1_url(@create_user1)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_user1_url(@create_user1)
    assert_response :success
  end

  test "should update create_user1" do
    patch create_user1_url(@create_user1), params: { create_user1: {  } }
    assert_redirected_to create_user1_url(@create_user1)
  end

  test "should destroy create_user1" do
    assert_difference("CreateUser1.count", -1) do
      delete create_user1_url(@create_user1)
    end

    assert_redirected_to create_user1s_url
  end
end
