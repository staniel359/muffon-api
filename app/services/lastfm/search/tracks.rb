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
        results.last(limit).map do |t|
          {
            id: track_id(t['artist'], t['name']),
            title: t['name'],
            artist: t['artist']
          }
        end
      end
    end
  end
end
