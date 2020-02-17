require 'test_helper'

class CaddiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get caddies_index_url
    assert_response :success
  end

  test "should get show" do
    get caddies_show_url
    assert_response :success
  end

  test "should get new" do
    get caddies_new_url
    assert_response :success
  end

  test "should get edit" do
    get caddies_edit_url
    assert_response :success
  end

end
