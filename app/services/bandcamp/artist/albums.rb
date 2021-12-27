module Bandcamp
  module Artist
    class Albums < Bandcamp::Artist::Base
      COLLECTION_NAME = 'albums'.freeze

      private

      def artist_data
        artist_base_data
          .merge(paginated_data)
      end

      def artist_base_data
        { name: name }
      end

      def name
        artist['name']
      end

      def total_items_count
        albums_list.size
      end

      def albums_list
        @albums_list ||=
          artist['discography']
      end

      def collection_list
        collection_paginated(
          albums_list
        )
      end

      def collection_item_data_formatted(album)
        Bandcamp::Artist::Albums::Album.call(
          album: album,
          profile_id: @args[:profile_id]
        )
      end

      alias artist response_data
    end
  end
end
