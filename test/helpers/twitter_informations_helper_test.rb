require 'test_helper'

class TwitterInformationsHelperTest < ActiveSupport::TestCase
	include TwitterInformationsHelper

	test "should get a twitter description" do
		require 'nokogiri'

		htm_twitter_page = <<-HTML
		<div class='ProfileHeaderCard'>
			<p>My name is Barry Allen, and i'm the fastest man alive</p>
		</div>
		HTML
		twitter_page_html = Nokogiri::HTML(htm_twitter_page)
		assert_equal "My name is Barry Allen, and i'm the fastest man alive",
    							fetch_twitter_description(twitter_page_html)
	end

	test "should get a twitter username" do
		require 'nokogiri'

		htm_twitter_page = <<-HTML
		<h2 class='ProfileHeaderCard-screenname u-inlineBlock u-dir'>
			<span> <b>thalissonmelo</b> </span>
		</h2>
		HTML

		twitter_page_html = Nokogiri::HTML(htm_twitter_page)
		assert_equal "thalissonmelo", fetch_twitter_username(twitter_page_html)
	end
end
