require 'test_helper'

class RootPageControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get root_page_welcome_url
    assert_response :success
  end

end
