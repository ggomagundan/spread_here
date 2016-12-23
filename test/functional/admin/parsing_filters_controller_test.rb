require 'test_helper'

class Admin::ParsingFiltersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ParsingFilter.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ParsingFilter.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ParsingFilter.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_parsing_filter_url(assigns(:parsing_filter))
  end

  def test_edit
    get :edit, :id => ParsingFilter.first
    assert_template 'edit'
  end

  def test_update_invalid
    ParsingFilter.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ParsingFilter.first
    assert_template 'edit'
  end

  def test_update_valid
    ParsingFilter.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ParsingFilter.first
    assert_redirected_to admin_parsing_filter_url(assigns(:parsing_filter))
  end

  def test_destroy
    parsing_filter = ParsingFilter.first
    delete :destroy, :id => parsing_filter
    assert_redirected_to admin_parsing_filters_url
    assert !ParsingFilter.exists?(parsing_filter.id)
  end
end
