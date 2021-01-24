module LastFM
  module Top
    class Artists < LastFM::Top::Base
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
