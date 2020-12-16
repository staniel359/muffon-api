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

      def collection_name
        'artists'
      end

      def collection
        response_data['artist'].last(limit).map do |a|
          {
            name: a['name'],
            listeners_count: a['listeners'].to_i
          }
        end
      end
    end
  end
end
