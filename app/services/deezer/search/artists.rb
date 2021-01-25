module Deezer
  module Search
    class Artists < Deezer::Search::Base
      include Deezer::Paginated

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
          images: images_data(artist, 'artist'),
          listeners_count: artist['nb_fan'],
          deezer_id: artist['id']
        }
      end
    end
  end
end
