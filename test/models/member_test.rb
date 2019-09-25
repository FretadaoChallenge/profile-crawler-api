require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  def setup
    @member = Member.new(
      name: 'Fretadão',
      twitter_profile_address: 'https://twitter.com/usefretadao'
    )
  end


  test "should save a valid member" do
    assert @member.save
  end

  test "should not save a member with invalid twitter_profile_address" do
    @member.twitter_profile_address = "https://twiter.com/usefretadao"
    assert_not @member.save
  end

  test "should not save a member with empty name" do
    @member.name = ""
    assert_not @member.save
  end

  test "should not save a member with name size bigger than 50" do
    @member.name = "A"*51
    assert_not @member.save
  end

  test "should save a member with twitter_profile_address withou 'https://www.'" do
    @member.twitter_profile_address = "twitter.com/usefretadao"
    assert @member.save
  end

  test "should not save members with the same twitter_username" do
    @member.save
    @new_member = Member.new(
      name: 'Fretadão2',
      twitter_profile_address: 'https://twitter.com/usefretadao'
    )
    assert_not @new_member.save
  end

  test "should edit twitter_profile_address when comes without 'https://www.'" do
    @member.twitter_profile_address = "twitter.com/usefretadao"
    @member.save
    assert_equal @member.twitter_profile_address, ("https://www.twitter.com/usefretadao")
  end

  test "should edit twitter_profile_address when comes without 'https://'" do
    @member.twitter_profile_address = "www.twitter.com/usefretadao"
    @member.save
    assert_equal @member.twitter_profile_address, ("https://www.twitter.com/usefretadao")
  end

end
