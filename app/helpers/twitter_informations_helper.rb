module TwitterInformationsHelper
# Makes a Web Scrapper to get the twitter description
    def get_twitter_informations
        unparsed_html = Nokogiri::HTML(open(self.twitter_profile_address))

        self.twitter_username = get_twitter_username(unparsed_html)
        self.twitter_description = get_twitter_description(unparsed_html)
    end

    def get_twitter_username(unparsed_html)
        from_html_username = unparsed_html.css('h2.ProfileHeaderCard-screenname.u-inlineBlock.u-dir span b')
        unless from_html_username.blank?
            from_html_username.text
        end
    end

    def get_twitter_description(unparsed_html)
        from_html_username = unparsed_html.css('h2.ProfileHeaderCard-screenname.u-inlineBlock.u-dir span b')
        unless from_html_username.blank?
            from_html_username.text
        end
    end
end