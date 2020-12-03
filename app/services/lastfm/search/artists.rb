module LastFM
  module Search
    class Artists < LastFM::Search::Base
      private

      def model_params
        { artist: @args.query }
      end

      def model_name
        'artist'
      end

      def results_data
        results.last(limit).map do |r|
          {
            name: r['name'],
            listeners_count: r['listeners'].to_i
          }
        end
      end
    end
  end
end
