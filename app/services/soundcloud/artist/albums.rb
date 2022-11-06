module SoundCloud
  module Artist
    class Albums < SoundCloud::Artist::Base
      COLLECTION_NAME = 'albums'.freeze
      LIMIT = 200

      include Muffon::Utils::Pagination

      private

      def albums_list
        response_data['collection']
      end

      def link
        "#{super}/albums"
      end

      def params
        super.merge(
          albums_params
        )
      end

      def albums_params
        { limit: LIMIT }
      end

      def collection_list
        collection_paginated(
          albums_list
        )
      end

      def artist_data
        super.merge(
          paginated_data
        )
      end

      def total_items_count
        @total_items_count ||= albums_list.size
      end

      def collection_item_data_formatted(album)
        SoundCloud::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
