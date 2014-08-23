require 'test_helper'

class OngsControllerTest < ActionController::TestCase
  setup do
    @ong = ongs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ongs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ong" do
    assert_difference('Ong.count') do
      post :create, ong: { city: @ong.city, comments: @ong.comments, country: @ong.country, country: @ong.country, email: @ong.email, facebook: @ong.facebook, international_network: @ong.international_network, name: @ong.name, national_network: @ong.national_network, phone: @ong.phone, state: @ong.state, street1: @ong.street1, street2: @ong.street2, website: @ong.website, zip: @ong.zip }
    end

    assert_redirected_to ong_path(assigns(:ong))
  end

  test "should show ong" do
    get :show, id: @ong
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ong
    assert_response :success
  end

  test "should update ong" do
    patch :update, id: @ong, ong: { city: @ong.city, comments: @ong.comments, country: @ong.country, country: @ong.country, email: @ong.email, facebook: @ong.facebook, international_network: @ong.international_network, name: @ong.name, national_network: @ong.national_network, phone: @ong.phone, state: @ong.state, street1: @ong.street1, street2: @ong.street2, website: @ong.website, zip: @ong.zip }
    assert_redirected_to ong_path(assigns(:ong))
  end

  test "should destroy ong" do
    assert_difference('Ong.count', -1) do
      delete :destroy, id: @ong
    end

    assert_redirected_to ongs_path
  end
end
