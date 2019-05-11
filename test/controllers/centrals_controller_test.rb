require 'test_helper'

class CentralsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @central = centrals(:one)
  end

  test "should get index" do
    get centrals_url
    assert_response :success
  end

  test "should get new" do
    get new_central_url
    assert_response :success
  end

  test "should create central" do
    assert_difference('Central.count') do
      post centrals_url, params: { central: { room_id: @central.room_id, room_name: @central.room_name } }
    end

    assert_redirected_to central_url(Central.last)
  end

  test "should show central" do
    get central_url(@central)
    assert_response :success
  end

  test "should get edit" do
    get edit_central_url(@central)
    assert_response :success
  end

  test "should update central" do
    patch central_url(@central), params: { central: { room_id: @central.room_id, room_name: @central.room_name } }
    assert_redirected_to central_url(@central)
  end

  test "should destroy central" do
    assert_difference('Central.count', -1) do
      delete central_url(@central)
    end

    assert_redirected_to centrals_url
  end
end
