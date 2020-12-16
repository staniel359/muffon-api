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

      def collection_name
        'tracks'
      end

      def collection
        response_data['track'].last(limit).map do |t|
          {
            title: t['name'],
            artist: t.dig('artist', 'name'),
            listeners_count: t['listeners'].to_i
          }
        end
      end
    end
  end
end
