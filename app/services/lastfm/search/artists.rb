module LastFM
  module Search
    class Artists < LastFM::Search::Base
      private

      def model_name
        'artist'
      end

      def artists
        parsed_response.dig('artistmatches', 'artist').map do |a|
          {
            name: a['name'],
            listeners_count: a['listeners'].to_i
          }
        end
      end
    end
  end
end
