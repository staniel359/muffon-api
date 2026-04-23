module LastFM
  module Tag
    class Artists < LastFM::Tag::Base
      API_METHOD = 'tag.getTopArtists'.freeze

      private

      def not_found?
        raw_collection.blank?
      end

      def raw_collection
        raw_tag_data['artist']
      end

      def raw_tag_data
        response_data['topartists']
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
          **artists_data
        }
      end

      def name
        raw_tag_data.dig(
          '@attr',
          'tag'
        )
      end

      def artists_data
        paginated_data(
          collection_name: 'artists',
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
        raw_artist_data
      )
        LastFM::Tag::Artists::Artist.call(
          raw_artist_data:,
          is_minimal: @args[:is_minimal],
          **self_args
        )
      end
    end
  end
end
