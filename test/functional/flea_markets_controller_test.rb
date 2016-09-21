require 'test_helper'

class FleaMarketsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

=begin
  def test_show
    get :show, :id => FleaMarket.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    FleaMarket.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    FleaMarket.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_flea_market_url(assigns(:flea_market))
  end

  def test_edit
    get :edit, :id => FleaMarket.first
    assert_template 'edit'
  end

  def test_update_invalid
    FleaMarket.any_instance.stubs(:valid?).returns(false)
    put :update, :id => FleaMarket.first
    assert_template 'edit'
  end

  def test_update_valid
    FleaMarket.any_instance.stubs(:valid?).returns(true)
    put :update, :id => FleaMarket.first
    assert_redirected_to admin_flea_market_url(assigns(:flea_market))
  end

  def test_destroy
    flea_market = FleaMarket.first
    delete :destroy, :id => flea_market
    assert_redirected_to admin_flea_markets_url
    assert !FleaMarket.exists?(flea_market.id)
  end
=end
end
