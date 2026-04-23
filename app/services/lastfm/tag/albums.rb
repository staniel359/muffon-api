module LastFM
  module Tag
    class Albums < LastFM::Tag::Base
      API_METHOD = 'tag.getTopAlbums'.freeze

      private

      def not_found?
        raw_collection.blank?
      end

      def raw_collection
        raw_tag_data['album']
      end

      def raw_tag_data
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
        raw_tag_data.dig(
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
        raw_tag_data.dig(
          '@attr',
          'total'
        ).to_i
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        LastFM::Tag::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
