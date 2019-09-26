require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = Member.create(
      name: 'Fretadão',
      twitter_profile_address: 'https://twitter.com/usefretadao'
    )
  end

  test "should create member" do
    assert_difference('Member.count') do
      post members_url, params: { member: { name: "Thalisson",
                                  twitter_profile_address: "www.twitter.com/thalissonmelo" } },
                                  as: :json
    end

    assert_response 201
  end

  test "should not create with invalid twitter url" do
    assert_no_difference('Member.count') do
      post members_url, params: { member: { name: "Thalisson",
                                  twitter_profile_address: "someaddress.com/thalissonmelo" } },
                                  as: :json
    end

    assert_response 422
  end

  test "should not create with invalid name" do
    assert_no_difference('Member.count') do
      post members_url, params: { member: { name: "",
                                  twitter_profile_address: "someaddress.com/thalissonmelo" } },
                                  as: :json
    end

    assert_response 422
  end

  test "should show member" do
    get member_url(@member), as: :json
    assert_response :success
  end

  test "should update member" do
    patch member_url(@member), params: { member: { name: "Thalisson",
                                         twitter_profile_address: "www.twitter.com/thalissonmelo" } },
                                         as: :json
    assert_response 200
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete member_url(@member), as: :json
    end

    assert_response 204
  end
end
