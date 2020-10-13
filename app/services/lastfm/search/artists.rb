module LastFM
  module Search
    class Artists < LastFM::Search::Base
      private

      def artist_query
        @args.query
      end

      def model_name
        'artist'
      end

      def results_data
        results.map do |a|
          {
            name: a['name'],
            listeners_count: a['listeners'].to_i
          }
        end
      end
    end
  end
end
