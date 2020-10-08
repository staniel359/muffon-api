module LastFM
  module Artist
    class Tracks < LastFM::API
      private

      def primary_args
        [@args.artist]
      end

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('artist.getTopTracks')
        )['toptracks']
      end

      def data
        { artist: tracks_data }
      end

      def tracks_data
        {
          name: parsed_response.dig('@attr', 'artist'),
          tracks: tracks,
          page: parsed_response.dig('@attr', 'page').to_i
        }
      end

      def tracks
        parsed_response['track'].map do |t|
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
