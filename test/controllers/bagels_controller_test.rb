require 'test_helper'

class BagelsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bagels_new_url
    assert_response :success
  end

  test "should get index" do
    get bagels_index_url
    assert_response :success
  end

  test "should get show" do
    get bagels_show_url
    assert_response :success
  end

  test "should get edit" do
    get bagels_edit_url
    assert_response :success
  end

end
