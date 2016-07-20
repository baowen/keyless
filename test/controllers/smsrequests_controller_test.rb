require 'test_helper'

class SmsrequestsControllerTest < ActionController::TestCase
  setup do
    @smsrequest = smsrequests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smsrequests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smsrequest" do
    assert_difference('Smsrequest.count') do
      post :create, smsrequest: { message: @smsrequest.message, mobile: @smsrequest.mobile }
    end

    assert_redirected_to smsrequest_path(assigns(:smsrequest))
  end

  test "should show smsrequest" do
    get :show, id: @smsrequest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smsrequest
    assert_response :success
  end

  test "should update smsrequest" do
    patch :update, id: @smsrequest, smsrequest: { message: @smsrequest.message, mobile: @smsrequest.mobile }
    assert_redirected_to smsrequest_path(assigns(:smsrequest))
  end

  test "should destroy smsrequest" do
    assert_difference('Smsrequest.count', -1) do
      delete :destroy, id: @smsrequest
    end

    assert_redirected_to smsrequests_path
  end
end
