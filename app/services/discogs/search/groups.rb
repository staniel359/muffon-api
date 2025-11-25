module Discogs
  module Search
    class Groups < Discogs::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'groups',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count: MAXIMUM_ITEMS_COUNT
        )
      end

      def params
        {
          **super,
          type: 'master'
        }
      end

      def collection_item_data_formatted(group)
        Discogs::Search::Groups::Group.call(
          group:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
