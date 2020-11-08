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
          name: extra_data['artist'],
          page: extra_data['page'].to_i,
          total_pages: extra_data['totalPages'].to_i,
          tracks: tracks
        }
      end

      def extra_data
        response_data['@attr']
      end

      def tracks
        response_data['track'].last(limit).map do |t|
          {
            id: track_id(t),
            title: t['name'],
            listeners_count: t['listeners'].to_i
          }
        end
      end

      def track_id(track)
        ::Track.with_artist_title(artist_id, track['name']).id
      end

      def artist_id
        @artist_id ||= ::Artist.with_name(extra_data['artist']).id
      end
    end
  end
end
