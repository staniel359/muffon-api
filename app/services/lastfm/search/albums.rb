module LastFM
  module Search
    class Albums < LastFM::Base
      def call
        return not_found_data if parsed_response.blank?

        { search: search_data }
      end

      private

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('album.search')
        )['results']
      end

      def search_data
        {
          query: { album: @args.album_title },
          results: albums,
          page: parsed_response.dig(
            'opensearch:Query', 'startPage'
          ).to_i
        }
      end

      def albums
        parsed_response.dig('albummatches', 'album').map do |a|
          {
            title: a['name'],
            artist: a['artist'],
            cover: a['image'].last['#text'].sub('/300x300', '')
          }
        end
      end
    end
  end
end
