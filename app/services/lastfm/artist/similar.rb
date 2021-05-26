module LastFM
  module Artist
    class Similar < LastFM::Artist::Base
      API_METHOD = 'artist.getSimilar'.freeze
      COLLECTION_NAME = 'similar'.freeze
      include LastFM::Utils::Pagination

      private

      def no_data?
        super || similar_list.blank?
      end

      def artist
        @artist ||= response_data['similarartists']
      end

      def similar_list
        @similar_list ||= artist['artist']
      end

      def total_items_count
        similar_list.size
      end

      def collection_list
        collection_paginated(similar_list)
      end

      def collection_item_data_formatted(artist)
        LastFM::Artist::Similar::Artist.call(
          artist: artist
        )
      end

      alias artist_data paginated_data
    end
  end
end
