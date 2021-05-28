module Odnoklassniki
  module Artist
    class Albums < Odnoklassniki::Artist::Base
      COLLECTION_NAME = 'albums'.freeze
      include Muffon::Utils::Pagination

      private

      def no_data?
        albums_list.blank? || page_out_of_bounds?
      end

      def albums_list
        @albums_list ||= response_data['masterAlbums']
      end

      def total_items_count
        albums_list.size
      end

      def collection_list
        collection_paginated(albums_list)
      end

      def collection_item_data_formatted(album)
        Odnoklassniki::Artist::Albums::Album.call(
          album: album
        )
      end

      alias artist_data paginated_data
    end
  end
end
