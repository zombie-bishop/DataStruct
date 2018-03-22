require 'test_helper'

class DataStructControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get data_struct_index_url
    assert_response :success
  end

end
