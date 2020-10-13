module LastFM
  module Search
    class Tracks < LastFM::Search::Base
      private

      def track_query
        @args.query
      end

      def model_name
        'track'
      end

      def results_data
        results.map do |t|
          {
            title: t['name'],
            artist: t['artist'],
            listeners_count: t['listeners'].to_i
          }
        end
      end
    end
  end
end
