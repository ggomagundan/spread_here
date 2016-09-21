require 'test_helper'

class Api::ContentImagesControllerTest < ActionController::TestCase
=begin
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ContentImage.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ContentImage.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ContentImage.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to api_content_image_url(assigns(:content_image))
  end
=begin
  def test_edit
    get :edit, :id => ContentImage.first
    assert_template 'edit'
  end

  def test_update_invalid
    ContentImage.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ContentImage.first
    assert_template 'edit'
  end

  def test_update_valid
    ContentImage.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ContentImage.first
    assert_redirected_to api_content_image_url(assigns(:content_image))
  end

  def test_destroy
    content_image = ContentImage.first
    delete :destroy, :id => content_image
    assert_redirected_to api_content_images_url
    assert !ContentImage.exists?(content_image.id)
  end
=end
end
