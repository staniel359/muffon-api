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
            id: track_id(t),
            title: t['name'],
            artist: t['artist']
          }
        end
      end

      def track_id(track)
        ::Track.with_artist_id_title(
          artist_id(track['artist']),
          track['name']
        ).id
      end

      def artist_id(name)
        ::Artist.with_name(name).id
      end
    end
  end
end
