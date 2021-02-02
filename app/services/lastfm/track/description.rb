module LastFM
  module Track
    class Description < LastFM::Track::Base
      private

      def service_info
        {
          api_method: 'track.getInfo',
          response_data_node: 'track'
        }
      end

      def track_data
        {
          title: title,
          artist: artist_data,
          description: description
        }
      end
    end
  end
end
