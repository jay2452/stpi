require 'test_helper'

class GcellsControllerTest < ActionController::TestCase
  setup do
    @gcell = gcells(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gcells)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gcell" do
    assert_difference('Gcell.count') do
      post :create, gcell: { content: @gcell.content }
    end

    assert_redirected_to gcell_path(assigns(:gcell))
  end

  test "should show gcell" do
    get :show, id: @gcell
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gcell
    assert_response :success
  end

  test "should update gcell" do
    patch :update, id: @gcell, gcell: { content: @gcell.content }
    assert_redirected_to gcell_path(assigns(:gcell))
  end

  test "should destroy gcell" do
    assert_difference('Gcell.count', -1) do
      delete :destroy, id: @gcell
    end

    assert_redirected_to gcells_path
  end
end
