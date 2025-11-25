module MusicBrainz
  module Search
    class Groups < MusicBrainz::Search::Base
      MODEL_NAME = 'release-group'.freeze

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

      def raw_collection
        response_data['release-groups']
      end

      def link
        "#{BASE_LINK}/release-group"
      end

      def collection_item_data_formatted(group)
        MusicBrainz::Search::Groups::Group.call(
          group:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
