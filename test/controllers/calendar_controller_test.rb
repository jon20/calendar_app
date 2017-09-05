require 'test_helper'

class CalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get mainpage" do
    get calendar_mainpage_url
    assert_response :success
  end

end
