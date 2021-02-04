module LastFM
  module Artist
    class Tracks < LastFM::Artist::API::Paginated
      private

      def model_name
        'track'
      end

      def collection_name
        'tracks'
      end

      def total_limit
        2_000
      end

      def collection_item_data(track)
        {
          id: track_id(extra_data['artist'], track['name']),
          title: track['name'],
          listeners_count: track['listeners'].to_i
        }
      end
    end
  end
end
