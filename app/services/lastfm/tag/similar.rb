module LastFM
  module Tag
    class Similar < LastFM::Tag::Web::Base
      private

      def tag_data
        {
          name: name,
          similar: similar
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

      def similar
        similar_list.map { |t| t.css('a')[0].text }
      end

      def similar_list
        response_data.css('.tags-list .tag')
      end
    end
  end
end
