module LastFM
  module Tag
    class Artists < LastFM::Tag::Base
      API_METHOD = 'tag.getTopArtists'.freeze

      private

      def not_found?
        super ||
          raw_collection.blank?
      end

      def raw_collection
        tag['artist']
      end

      def tag
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
        tag.dig(
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
        tag.dig(
          '@attr',
          'total'
        ).to_i
      end

      def collection_item_data_formatted(artist)
        LastFM::Tag::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token],
          minimal: @args[:minimal]
        )
      end
    end
  end
end
