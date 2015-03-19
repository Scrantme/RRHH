require 'test_helper'

class BusquedasControllerTest < ActionController::TestCase
  setup do
    @busqueda = busquedas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:busquedas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create busqueda" do
    assert_difference('Busqueda.count') do
      post :create, busqueda: {  }
    end

    assert_redirected_to busqueda_path(assigns(:busqueda))
  end

  test "should show busqueda" do
    get :show, id: @busqueda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @busqueda
    assert_response :success
  end

  test "should update busqueda" do
    put :update, id: @busqueda, busqueda: {  }
    assert_redirected_to busqueda_path(assigns(:busqueda))
  end

  test "should destroy busqueda" do
    assert_difference('Busqueda.count', -1) do
      delete :destroy, id: @busqueda
    end

    assert_redirected_to busquedas_path
  end
end
