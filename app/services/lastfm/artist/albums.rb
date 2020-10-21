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
          page: response_data.dig('@attr', 'page').to_i,
          albums: albums
        }
      end

      def albums
        response_data['album'].map do |a|
          {
            title: a['name'],
            covers: covers(a),
            plays_count: a['playcount'].to_i
          }
        end
      end

      def covers(album)
        {
          original: crop_cover(album, ''),
          cropped_600: crop_cover(album, '/600x600'),
          cropped_300: crop_cover(album, '/300x300')
        }
      end

      def crop_cover(album, crop)
        album['image'].last['#text'].sub('/300x300', crop)
      end
    end
  end
end
