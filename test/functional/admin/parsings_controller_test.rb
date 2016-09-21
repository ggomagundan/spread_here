require 'test_helper'

class Admin::ParsingsControllerTest < ActionController::TestCase
=begin
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Parsing.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Parsing.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Parsing.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_parsing_url(assigns(:parsing))
  end

  def test_edit
    get :edit, :id => Parsing.first
    assert_template 'edit'
  end

  def test_update_invalid
    Parsing.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Parsing.first
    assert_template 'edit'
  end

  def test_update_valid
    Parsing.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Parsing.first
    assert_redirected_to admin_parsing_url(assigns(:parsing))
  end

  def test_destroy
    parsing = Parsing.first
    delete :destroy, :id => parsing
    assert_redirected_to admin_parsings_url
    assert !Parsing.exists?(parsing.id)
  end
=end
end
