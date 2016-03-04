require 'test_helper'

class ItParksControllerTest < ActionController::TestCase
  setup do
    @it_park = it_parks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:it_parks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create it_park" do
    assert_difference('ItPark.count') do
      post :create, it_park: { content: @it_park.content }
    end

    assert_redirected_to it_park_path(assigns(:it_park))
  end

  test "should show it_park" do
    get :show, id: @it_park
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @it_park
    assert_response :success
  end

  test "should update it_park" do
    patch :update, id: @it_park, it_park: { content: @it_park.content }
    assert_redirected_to it_park_path(assigns(:it_park))
  end

  test "should destroy it_park" do
    assert_difference('ItPark.count', -1) do
      delete :destroy, id: @it_park
    end

    assert_redirected_to it_parks_path
  end
end
