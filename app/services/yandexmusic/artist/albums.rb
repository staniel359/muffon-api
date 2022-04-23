module YandexMusic
  module Artist
    class Albums < YandexMusic::Artist::Base
      COLLECTION_NAME = 'albums'.freeze
      include Muffon::Utils::Pagination

      private

      def albums_list
        @albums_list ||= artist['albums']
      end

      def artist_data
        super.merge(
          paginated_data
        )
      end

      def collection_list
        collection_paginated(
          albums_list
        )
      end

      def total_items_count
        albums_list.size
      end

      def collection_item_data_formatted(album)
        YandexMusic::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
