module LastFM
  module Top
    class Tracks < LastFM::Top::Base
      private

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('chart.getTopTracks')
        )['tracks']
      end

      def top_data
        { tracks: tracks, page: page }
      end

      def tracks
        parsed_response['track'].map do |t|
          {
            title: t['name'],
            artist: t.dig('artist', 'name')
          }
        end
      end
    end
  end
end
