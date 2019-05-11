require "application_system_test_case"

class CentralsTest < ApplicationSystemTestCase
  setup do
    @central = centrals(:one)
  end

  test "visiting the index" do
    visit centrals_url
    assert_selector "h1", text: "Centrals"
  end

  test "creating a Central" do
    visit centrals_url
    click_on "New Central"

    fill_in "Room", with: @central.room_id
    fill_in "Room name", with: @central.room_name
    click_on "Create Central"

    assert_text "Central was successfully created"
    click_on "Back"
  end

  test "updating a Central" do
    visit centrals_url
    click_on "Edit", match: :first

    fill_in "Room", with: @central.room_id
    fill_in "Room name", with: @central.room_name
    click_on "Update Central"

    assert_text "Central was successfully updated"
    click_on "Back"
  end

  test "destroying a Central" do
    visit centrals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Central was successfully destroyed"
  end
end
