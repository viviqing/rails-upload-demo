require 'test_helper'

class UploadPicturesControllerTest < ActionController::TestCase
  setup do
    @upload_picture = upload_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:upload_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create upload_picture" do
    assert_difference('UploadPicture.count') do
      post :create, upload_picture: {  }
    end

    assert_redirected_to upload_picture_path(assigns(:upload_picture))
  end

  test "should show upload_picture" do
    get :show, id: @upload_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @upload_picture
    assert_response :success
  end

  test "should update upload_picture" do
    patch :update, id: @upload_picture, upload_picture: {  }
    assert_redirected_to upload_picture_path(assigns(:upload_picture))
  end

  test "should destroy upload_picture" do
    assert_difference('UploadPicture.count', -1) do
      delete :destroy, id: @upload_picture
    end

    assert_redirected_to upload_pictures_path
  end
end
