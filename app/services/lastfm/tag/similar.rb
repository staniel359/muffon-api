module LastFM
  module Tag
    class Similar < LastFM::Tag::Web::Base
      private

      def tag_data
        {
          name: name.downcase,
          similar: tags
        }
      end

      def name
        response_data.css('title').text.match(
          /(.+) music | Last.fm/
        )[1]
      end

      def link
        base_link
      end

      def tags_list
        response_data.css('.tags-list .tag')
      end
    end
  end
end
