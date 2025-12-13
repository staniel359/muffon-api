module LastFM
  module Search
    class Tags < LastFM::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'tags',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count:
        )
      end

      def raw_collection
        tags
          .limit(limit)
          .offset(offset)
      end

      def tags
        ::Tag.where(
          'name_downcase LIKE ?',
          query_formatted
        )
      end

      def query_formatted
        "%#{@args[:query]}%"
      end

      def items_count
        tags.count
      end

      def collection_item_data_formatted(tag)
        LastFM::Search::Tags::Tag.call(
          tag:
        )
      end
    end
  end
end
