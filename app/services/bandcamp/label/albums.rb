module Bandcamp
  module Label
    class Albums < Bandcamp::Label::Base
      COLLECTION_NAME = 'albums'.freeze

      private

      def total_items_count
        albums_list.size
      end

      def albums_list
        @albums_list ||=
          response_data['discography']
      end

      def collection_list
        collection_paginated(
          albums_list
        )
      end

      def collection_item_data_formatted(album)
        Bandcamp::Label::Albums::Album.call(
          album:
        )
      end
    end
  end
end
