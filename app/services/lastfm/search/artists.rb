module LastFM
  module Search
    class Artists < LastFM::Search::Base
      private

      def model_name
        'artist'
      end

      def collection_name
        'artists'
      end

      def collection_item_data(artist)
        {
          name: artist['name'],
          listeners_count: artist['listeners'].to_i
        }
      end
    end
  end
end
