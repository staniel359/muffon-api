module LastFM
  module Top
    class Tracks < LastFM::Top::Base
      private

      def model_name
        'track'
      end

      def collection_name
        'tracks'
      end

      def collection_item_data(track)
        {
          title: track['name'],
          artist: track_artist_data(track),
          listeners_count: track['listeners'].to_i
        }
      end

      def track_artist_data(track)
        { name: track.dig('artist', 'name') }
      end
    end
  end
end
