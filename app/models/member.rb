class Member < ApplicationRecord
    validates :twitter_description, length: { maximum: 160 }
    validates :name, presence: true, length: { in: 1..50 }
    validates :twitter_profile_address, presence: true, uniqueness: true
    validates_format_of :twitter_profile_address,
    with: /https:\/\/twitter\.com\/[a-zA-Z0-9_]+/
end