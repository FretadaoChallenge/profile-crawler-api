class Member < ApplicationRecord
  include TwitterInformationsHelper
  include Shortener::ShortenerHelper
  include Rails.application.routes.url_helpers

  before_save :shorten_twitter_url, :get_twitter_informations
  before_validation :checking_twitter_profile_address
  
  validates :twitter_description, length: { maximum: 160 }
  validates :name, presence: true, length: { in: 1..50 }
  validates :twitter_profile_address, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :twitter_profile_address,
  with: /(?:http:\/\/)?(?:www\.)?twitter\.com\/[a-zA-Z0-9_]+/

  def checking_twitter_profile_address
      if((twitter_profile_address.split('twitter.com/').first).blank?)
          self.twitter_profile_address = "https://www.#{self.twitter_profile_address}"
      elsif((twitter_profile_address.split('twitter.com/').first) == 'www.')
          self.twitter_profile_address = "https://#{self.twitter_profile_address}"
      end
  end

  def shorten_twitter_url
      unless twitter_profile_address.blank?
          self.shortened_url = short_url(self.twitter_profile_address,
          url_options: { host: 'localhost:3000' })
      end
  end

  #making the search
  def self.search(search)
    unless search.blank?
      where("lower(members.name) LIKE :search OR
             lower(members.twitter_username) LIKE :search OR
             lower(members.twitter_description) LIKE :search",
             search: "%#{((search.to_s).downcase)}%").uniq
    end
  end
end