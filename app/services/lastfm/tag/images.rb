module LastFM
  module Tag
    class Images < LastFM::Tag::Kerve::Base
      COLLECTION_NAME = 'artists'.freeze
      MODEL_NAME = 'artist'.freeze
      TOTAL_LIMIT = 15

      private

      def tag_data
        { images: collection }
      end

      def collection_item_data_formatted(artist)
        artist['image']
      end
    end
  end
end
