require "test_helper"

class SviensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @svien = sviens(:one)
  end

  test "should get index" do
    get sviens_url
    assert_response :success
  end

  test "should get new" do
    get new_svien_url
    assert_response :success
  end

  test "should create svien" do
    assert_difference("Svien.count") do
      post sviens_url, params: { svien: { msv: @svien.msv, name: @svien.name } }
    end

    assert_redirected_to svien_url(Svien.last)
  end

  test "should show svien" do
    get svien_url(@svien)
    assert_response :success
  end

  test "should get edit" do
    get edit_svien_url(@svien)
    assert_response :success
  end

  test "should update svien" do
    patch svien_url(@svien), params: { svien: { msv: @svien.msv, name: @svien.name } }
    assert_redirected_to svien_url(@svien)
  end

  test "should destroy svien" do
    assert_difference("Svien.count", -1) do
      delete svien_url(@svien)
    end

    assert_redirected_to sviens_url
  end
end
