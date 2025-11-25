module LastFM
  module Tag
    class Albums < LastFM::Tag::Base
      API_METHOD = 'tag.getTopAlbums'.freeze

      private

      def not_found?
        super ||
          raw_collection.blank?
      end

      def raw_collection
        tag['album']
      end

      def tag
        response_data['albums']
      end

      def params
        {
          **super,
          page:,
          limit:
        }
      end

      def tag_data
        {
          **super,
          **albums_data
        }
      end

      def name
        tag.dig(
          '@attr',
          'tag'
        )
      end

      def albums_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count: MAXIMUM_ITEMS_COUNT
        )
      end

      def items_count
        tag.dig(
          '@attr',
          'total'
        ).to_i
      end

      def collection_item_data_formatted(album)
        LastFM::Tag::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
