module Bandcamp
  module Artist
    class Albums < Bandcamp::Artist::Base
      COLLECTION_NAME = 'albums'.freeze

      private

      def artist_data
        {
          **super,
          **paginated_data
        }
      end

      def collection_list
        collection_paginated(
          raw_albums
        )
      end

      def raw_albums
        artist['discography']
      end

      def total_items_count
        raw_albums.size
      end

      def collection_item_data_formatted(album)
        Bandcamp::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
