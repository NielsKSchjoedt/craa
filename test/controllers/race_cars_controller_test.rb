require 'test_helper'

class RaceCarsControllerTest < ActionController::TestCase
  setup do
    @race_car = race_cars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:race_cars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create race_car" do
    assert_difference('RaceCar.count') do
      post :create, race_car: { ccm: @race_car.ccm, class_type: @race_car.class_type, description: @race_car.description, hp: @race_car.hp, make: @race_car.make, model: @race_car.model, start_no: @race_car.start_no, year: @race_car.year }
    end

    assert_redirected_to race_car_path(assigns(:race_car))
  end

  test "should show race_car" do
    get :show, id: @race_car
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @race_car
    assert_response :success
  end

  test "should update race_car" do
    patch :update, id: @race_car, race_car: { ccm: @race_car.ccm, class_type: @race_car.class_type, description: @race_car.description, hp: @race_car.hp, make: @race_car.make, model: @race_car.model, start_no: @race_car.start_no, year: @race_car.year }
    assert_redirected_to race_car_path(assigns(:race_car))
  end

  test "should destroy race_car" do
    assert_difference('RaceCar.count', -1) do
      delete :destroy, id: @race_car
    end

    assert_redirected_to race_cars_path
  end
end
