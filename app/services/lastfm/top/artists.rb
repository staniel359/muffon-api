module LastFM
  module Top
    class Artists < LastFM::Top::Base
      private

      def service_info
        {
          api_method: 'chart.getTopArtists',
          response_data_node: 'artists'
        }
      end

      def top_data
        {
          page: page,
          artists: artists
        }
      end

      def artists
        response_data['artist'].map { |a| a['name'] }
      end
    end
  end
end
