require "application_system_test_case"

class CreateUser1sTest < ApplicationSystemTestCase
  setup do
    @create_user1 = create_user1s(:one)
  end

  test "visiting the index" do
    visit create_user1s_url
    assert_selector "h1", text: "Create user1s"
  end

  test "should create create user1" do
    visit create_user1s_url
    click_on "New create user1"

    click_on "Create Create user1"

    assert_text "Create user1 was successfully created"
    click_on "Back"
  end

  test "should update Create user1" do
    visit create_user1_url(@create_user1)
    click_on "Edit this create user1", match: :first

    click_on "Update Create user1"

    assert_text "Create user1 was successfully updated"
    click_on "Back"
  end

  test "should destroy Create user1" do
    visit create_user1_url(@create_user1)
    click_on "Destroy this create user1", match: :first

    assert_text "Create user1 was successfully destroyed"
  end
end
