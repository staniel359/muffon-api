module Genius
  module Artist
    class Albums < Genius::Artist::Base
      COLLECTION_NAME = 'albums'.freeze
      LIMIT = 50

      include Muffon::Utils::Pagination

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
        artist.dig(
          'response',
          'albums'
        )
      end

      def link
        "#{super}/albums"
      end

      def params
        {
          **super,
          per_page: LIMIT
        }
      end

      def total_items_count
        raw_albums.size
      end

      def collection_item_data_formatted(album)
        Genius::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
