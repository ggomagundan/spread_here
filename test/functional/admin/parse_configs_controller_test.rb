require 'test_helper'

class Admin::ParseConfigsControllerTest < ActionController::TestCase
=begin
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ParseConfig.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ParseConfig.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ParseConfig.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_parse_config_url(assigns(:parse_config))
  end

  def test_edit
    get :edit, :id => ParseConfig.first
    assert_template 'edit'
  end

  def test_update_invalid
    ParseConfig.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ParseConfig.first
    assert_template 'edit'
  end

  def test_update_valid
    ParseConfig.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ParseConfig.first
    assert_redirected_to admin_parse_config_url(assigns(:parse_config))
  end

  def test_destroy
    parse_config = ParseConfig.first
    delete :destroy, :id => parse_config
    assert_redirected_to admin_parse_configs_url
    assert !ParseConfig.exists?(parse_config.id)
  end
=end
end
