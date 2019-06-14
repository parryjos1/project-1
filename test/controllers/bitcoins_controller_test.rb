require 'test_helper'

class BitcoinsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bitcoins_new_url
    assert_response :success
  end

  test "should get create" do
    get bitcoins_create_url
    assert_response :success
  end

  test "should get show" do
    get bitcoins_show_url
    assert_response :success
  end

  test "should get edit" do
    get bitcoins_edit_url
    assert_response :success
  end

  test "should get update" do
    get bitcoins_update_url
    assert_response :success
  end

  test "should get destroy" do
    get bitcoins_destroy_url
    assert_response :success
  end

end
