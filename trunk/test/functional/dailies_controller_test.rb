require 'test_helper'

class DailiesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:dailies)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_daily
    assert_difference('Daily.count') do
      post :create, :daily => { }
    end

    assert_redirected_to daily_path(assigns(:daily))
  end

  def test_should_show_daily
    get :show, :id => dailies(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => dailies(:one).id
    assert_response :success
  end

  def test_should_update_daily
    put :update, :id => dailies(:one).id, :daily => { }
    assert_redirected_to daily_path(assigns(:daily))
  end

  def test_should_destroy_daily
    assert_difference('Daily.count', -1) do
      delete :destroy, :id => dailies(:one).id
    end

    assert_redirected_to dailies_path
  end
end
