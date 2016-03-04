require 'test_helper'

class SubCentersControllerTest < ActionController::TestCase
  setup do
    @sub_center = sub_centers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_centers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_center" do
    assert_difference('SubCenter.count') do
      post :create, sub_center: { content: @sub_center.content }
    end

    assert_redirected_to sub_center_path(assigns(:sub_center))
  end

  test "should show sub_center" do
    get :show, id: @sub_center
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_center
    assert_response :success
  end

  test "should update sub_center" do
    patch :update, id: @sub_center, sub_center: { content: @sub_center.content }
    assert_redirected_to sub_center_path(assigns(:sub_center))
  end

  test "should destroy sub_center" do
    assert_difference('SubCenter.count', -1) do
      delete :destroy, id: @sub_center
    end

    assert_redirected_to sub_centers_path
  end
end
