require 'test_helper'

class LibrisControllerTest < ActionController::TestCase

# We need index to initiate the API search_result
test "should get index" do
  get :index
  assert_response :success #route success
  assert_template :index
end

# To start with we want a show page for the record from the API
test "should get show" do
  skip
end

#But eventually we want the record to auto populate in show so we can create it for our own database
# When submitting the show form it should reach for the create controller
test "should get create" do
  skip
end

end
