require 'test_helper'

class SearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fretadao = Member.create(
      name: 'Fretadão',
      twitter_profile_address: 'https://twitter.com/usefretadao'
    )
    @member = Member.create(
      name: 'ThalissonMelo',
      twitter_profile_address: 'https://twitter.com/thalissonmelo'
    )
  end
  test "should search by members" do
    get search_url, params: {
      search: "ThalissonMelo"
    }
    assert_response 200
  end
  test "should get the requested search" do
    get search_url, params: {
      search: "ThalissonMelo"
    }
    search_return = JSON.parse(response.body)
    assert_equal 1, search_return.size
    assert_equal "ThalissonMelo", search_return.first['name']
  end
end
