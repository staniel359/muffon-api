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
          name: extra_data['artist'],
          page: extra_data['page'].to_i,
          total_pages: extra_data['totalPages'].to_i,
          albums: albums
        }
      end

      def extra_data
        response_data['@attr']
      end

      def albums
        response_data['album'].last(limit).map do |a|
          {
            title: a['name'],
            covers: covers(a)
          }
        end
      end

      def covers(album)
        {
          original: crop_cover(album, ''),
          large: crop_cover(album, '/600x600'),
          medium: crop_cover(album, '/300x300')
        }
      end

      def crop_cover(album, crop)
        album['image'].last['#text'].sub('/300x300', crop)
      end
    end
  end
end
