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
          name: response_data.dig('@attr', 'artist'),
          tracks: tracks,
          page: response_data.dig('@attr', 'page').to_i
        }
      end

      def tracks
        response_data['track'].map do |t|
          {
            title: t['name'],
            plays_count: t['playcount'].to_i,
            listeners_count: t['listeners'].to_i
          }
        end
      end
    end
  end
end
