module LastFM
  module Top
    class Tracks < LastFM::Top::Base
      private

      def service_info
        {
          api_method: 'chart.getTopTracks',
          response_data_node: 'tracks'
        }
      end

      def top_data
        {
          page: page,
          tracks: tracks
        }
      end

      def tracks
        response_data['track'].map do |t|
          {
            title: t['name'],
            artist: t.dig('artist', 'name')
          }
        end
      end
    end
  end
end
