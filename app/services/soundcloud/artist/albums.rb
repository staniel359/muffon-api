module SoundCloud
  module Artist
    class Albums < SoundCloud::Artist::Base
      COLLECTION_NAME = 'albums'.freeze
      LIMIT = 200

      include Muffon::Utils::Pagination

      private

      def artist_data
        {
          **super,
          **paginated_data
        }
      end

      def albums_list
        artist['collection']
      end

      def link
        "#{super}/albums"
      end

      def params
        {
          **super,
          limit: LIMIT
        }
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
        SoundCloud::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
