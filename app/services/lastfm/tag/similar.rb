module LastFM
  module Tag
    class Similar < LastFM::Tag::Base
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

      def similar
        similar_list.map { |t| t.css('a')[0].text }
      end

      def similar_list
        response_data.css('.tags-list .tag')
      end

      def link
        "https://www.last.fm/tag/#{tag_name}"
      end
    end
  end
end
