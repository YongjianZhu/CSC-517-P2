require 'test_helper'

class OverdueControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get overdue_index_url
    assert_response :success
  end

end
