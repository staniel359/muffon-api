module LastFM
  module Search
    class Tracks < LastFM::Search::Base
      private

      def model_params
        { track: @args.query }
      end

      def model_name
        'track'
      end

      def results_data
        results.map do |t|
          {
            title: t['name'],
            artist: t['artist']
          }
        end
      end
    end
  end
end
