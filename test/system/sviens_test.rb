require "application_system_test_case"

class SviensTest < ApplicationSystemTestCase
  setup do
    @svien = sviens(:one)
  end

  test "visiting the index" do
    visit sviens_url
    assert_selector "h1", text: "Sviens"
  end

  test "should create svien" do
    visit sviens_url
    click_on "New svien"

    fill_in "Msv", with: @svien.msv
    fill_in "Name", with: @svien.name
    click_on "Create Svien"

    assert_text "Svien was successfully created"
    click_on "Back"
  end

  test "should update Svien" do
    visit svien_url(@svien)
    click_on "Edit this svien", match: :first

    fill_in "Msv", with: @svien.msv
    fill_in "Name", with: @svien.name
    click_on "Update Svien"

    assert_text "Svien was successfully updated"
    click_on "Back"
  end

  test "should destroy Svien" do
    visit svien_url(@svien)
    click_on "Destroy this svien", match: :first

    assert_text "Svien was successfully destroyed"
  end
end
