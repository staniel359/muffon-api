module LastFM
  module Artist
    class Tracks < LastFM::API
      private

      def service_info
        {
          api_method: 'artist.getTopTracks',
          response_data_node: 'toptracks'
        }
      end

      def primary_args
        [@args.artist]
      end

      def api_method
        'artist.getTopTracks'
      end

      def data
        { artist: tracks_data }
      end

      def tracks_data
        {
          name: artist_name,
          page: extra_data['page'].to_i,
          total_pages: extra_data['totalPages'].to_i,
          tracks: tracks
        }
      end

      def artist_name
        extra_data['artist']
      end

      def extra_data
        response_data['@attr']
      end

      def tracks
        response_data['track'].last(limit).map do |t|
          {
            id: track_id(artist_name, t['name']),
            title: t['name'],
            listeners_count: t['listeners'].to_i
          }
        end
      end
    end
  end
end
