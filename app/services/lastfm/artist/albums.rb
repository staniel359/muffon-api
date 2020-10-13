module LastFM
  module Artist
    class Albums < LastFM::API
      private

      def service_info
        {
          api_method: 'artist.getTopAlbums',
          response_data_node: 'topalbums'
        }
      end

      def primary_args
        [@args.artist]
      end

      def data
        { artist: albums_data }
      end

      def albums_data
        {
          name: response_data.dig('@attr', 'artist'),
          albums: albums,
          page: response_data.dig('@attr', 'page').to_i
        }
      end

      def albums
        response_data['album'].map do |a|
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
