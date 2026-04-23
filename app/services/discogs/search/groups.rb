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
          maximum_items_count:
        )
      end

      def params
        {
          **super,
          type: SCOPES_PARAMS_DATA['groups']
        }
      end

      def collection_item_data_formatted(
        raw_album_group_data
      )
        Discogs::Search::Groups::Group.call(
          raw_album_group_data:,
          **self_args
        )
      end
    end
  end
end
