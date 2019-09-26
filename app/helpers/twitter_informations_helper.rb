module TwitterInformationsHelper
    require 'nokogiri'
    require 'open-uri'

    # Makes a Web Scrapper to get the twitter description
    def fetch_twitter_informations
        unparsed_html = Nokogiri::HTML(open(twitter_profile_address))

        self.twitter_username = fetch_twitter_username(unparsed_html)
        self.twitter_description = fetch_twitter_description(unparsed_html)
    end

    def fetch_twitter_username(unparsed_html)
        from_html_username = unparsed_html.css('h2.ProfileHeaderCard-screenname.u-inlineBlock.u-dir span b')
        unless from_html_username.blank?
            from_html_username.text
        end
    end

    def fetch_twitter_description(unparsed_html)
        from_html_username = unparsed_html.css('div.ProfileHeaderCard p')
        unless from_html_username.blank?
            from_html_username.text
        end
    end
end
