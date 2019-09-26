class Member < ApplicationRecord
  include TwitterInformationsHelper
  include Shortener::ShortenerHelper
  include Rails.application.routes.url_helpers

  before_save :shorten_twitter_url, :fetch_twitter_informations
  before_validation :checking_twitter_profile_address

  validates :twitter_description, length: { maximum: 160 }
  validates :name, presence: true, length: { in: 1..50 }
  validates :twitter_profile_address, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :twitter_profile_address,
  with: /(?:http:\/\/)?(?:www\.)?twitter\.com\/[a-zA-Z0-9_]+/

  def checking_twitter_profile_address
    if twitter_profile_address.include? "twitter.com/"
      format_twitter_url
    end
  end

  def format_twitter_url
    username = twitter_profile_address.split('twitter.com/').last
    self.twitter_profile_address = "https://www.twitter.com/#{username}"
  end

  def shorten_twitter_url
      unless twitter_profile_address.blank?
          self.shortened_url = short_url(twitter_profile_address,
          url_options: { host: 'localhost:3000' })
      end
  end

  # making the search
  def self.search(search)
    unless search.blank?
      where("lower(members.name) LIKE :search OR
             lower(members.twitter_username) LIKE :search OR
             lower(members.twitter_description) LIKE :search",
             search: "%#{search.downcase}%").uniq
    end
  end
end
