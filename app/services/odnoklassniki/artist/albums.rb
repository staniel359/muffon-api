module Odnoklassniki
  module Artist
    class Albums < Odnoklassniki::Artist::Base
      COLLECTION_NAME = 'albums'.freeze
      include Muffon::Utils::Pagination

      private

      def albums_list
        response_data['masterAlbums'] || []
      end

      def artist_data
        super.merge(
          paginated_data
        )
      end

      def name
        response_data.dig(
          'artist', 'name'
        )
      end

      def total_items_count
        @total_items_count ||= albums_list.size
      end

      def collection_list
        collection_paginated(
          albums_list
        )
      end

      def collection_item_data_formatted(album)
        Odnoklassniki::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
