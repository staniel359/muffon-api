module LastFM
  module Artist
    class Albums < LastFM::API
      private

      def primary_args
        [@args.artist]
      end

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('artist.getTopAlbums')
        )['topalbums']
      end

      def data
        { artist: albums_data }
      end

      def albums_data
        {
          name: parsed_response.dig('@attr', 'artist'),
          albums: albums,
          page: parsed_response.dig('@attr', 'page').to_i
        }
      end

      def albums
        parsed_response['album'].map do |a|
          {
            title: a['name'],
            cover: a['image'].last['#text'].sub('/300x300', ''),
            plays_count: a['playcount'].to_i
          }
        end
      end
    end
  end
end