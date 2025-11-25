module LastFM
  module Top
    class Tags < LastFM::Top::Base
      PAGE_LIMIT = 1_000

      private

      def top_data
        paginated_data(
          collection_name: 'tags',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true
        )
      end

      def raw_collection
        response_data.dig(
          'tags',
          'tag'
        )
      end

      def api_method
        raise not_found_error if country_code.present?

        'chart.getTopTags'
      end

      def params
        {
          **super,
          limit: PAGE_LIMIT
        }
      end

      def items_count
        response_data
          .dig(
            'tags',
            '@attr',
            'total'
          ).to_i
      end

      def collection_item_data_formatted(tag)
        { name: tag['name'] }
      end
    end
  end
end
