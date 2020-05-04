require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get top,index,show" do
    get items_top,index,show_url
    assert_response :success
  end

end
