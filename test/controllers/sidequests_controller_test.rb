require 'test_helper'

class SidequestsControllerTest < ActionController::TestCase
  setup do
    @sidequest = sidequests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sidequests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sidequest" do
    assert_difference('Sidequest.count') do
      post :create, sidequest: { challenger_answer: @sidequest.challenger_answer, challenger_id: @sidequest.challenger_id, content: @sidequest.content, level: @sidequest.level, recipient: @sidequest.recipient, recipient_answer: @sidequest.recipient_answer, teacher_id: @sidequest.teacher_id }
    end

    assert_redirected_to sidequest_path(assigns(:sidequest))
  end

  test "should show sidequest" do
    get :show, id: @sidequest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sidequest
    assert_response :success
  end

  test "should update sidequest" do
    patch :update, id: @sidequest, sidequest: { challenger_answer: @sidequest.challenger_answer, challenger_id: @sidequest.challenger_id, content: @sidequest.content, level: @sidequest.level, recipient: @sidequest.recipient, recipient_answer: @sidequest.recipient_answer, teacher_id: @sidequest.teacher_id }
    assert_redirected_to sidequest_path(assigns(:sidequest))
  end

  test "should destroy sidequest" do
    assert_difference('Sidequest.count', -1) do
      delete :destroy, id: @sidequest
    end

    assert_redirected_to sidequests_path
  end
end
