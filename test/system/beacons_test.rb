require "application_system_test_case"

class BeaconsTest < ApplicationSystemTestCase
  setup do
    @beacon = beacons(:one)
  end

  test "visiting the index" do
    visit beacons_url
    assert_selector "h1", text: "Beacons"
  end

  test "creating a Beacon" do
    visit beacons_url
    click_on "New Beacon"

    fill_in "Central", with: @beacon.central_id
    fill_in "Distance", with: @beacon.distance
    fill_in "Orientation", with: @beacon.orientation
    click_on "Create Beacon"

    assert_text "Beacon was successfully created"
    click_on "Back"
  end

  test "updating a Beacon" do
    visit beacons_url
    click_on "Edit", match: :first

    fill_in "Central", with: @beacon.central_id
    fill_in "Distance", with: @beacon.distance
    fill_in "Orientation", with: @beacon.orientation
    click_on "Update Beacon"

    assert_text "Beacon was successfully updated"
    click_on "Back"
  end

  test "destroying a Beacon" do
    visit beacons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Beacon was successfully destroyed"
  end
end
