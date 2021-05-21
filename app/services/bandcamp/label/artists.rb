module Bandcamp
  module Label
    class Artists < Bandcamp::Label::Base
      COLLECTION_NAME = 'artists'.freeze

      private

      def total_items_count
        artists_list.size
      end

      def artists_list
        @artists_list ||= response_data['artists']
      end

      def collection_list
        collection_paginated(artists_list)
      end

      def collection_item_data_formatted(artist)
        Bandcamp::Label::Artists::Artist.call(
          artist: artist
        )
      end
    end
  end
end
