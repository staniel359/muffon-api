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
            id: track_id(artist_name(t), title(t)),
            title: title(t),
            artist: artist_name(t)
          }
        end
      end

      def artist_name(track)
        track['artist']
      end

      def title(track)
        track['name']
      end
    end
  end
end
