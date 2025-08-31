module Odnoklassniki
  module Artist
    class Albums < Odnoklassniki::Artist::Base
      COLLECTION_NAME = 'albums'.freeze

      include Muffon::Utils::Pagination

      private

      def artist_data
        {
          **super,
          **paginated_data
        }
      end

      def albums_list
        artist['masterAlbums'] || []
      end

      def total_items_count
        albums_list.size
      end

      def collection_list
        collection_paginated(
          albums_list
        )
      end

      def collection_item_data_formatted(album)
        Odnoklassniki::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
