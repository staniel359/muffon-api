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
          maximum_items_count:
        )
      end

      def raw_collection
        response_data['release-groups']
      end

      def request_url
        "#{REQUEST_BASE_URL}/release-group"
      end

      def collection_item_data_formatted(
        raw_album_group_data
      )
        MusicBrainz::Search::Groups::Group.call(
          raw_album_group_data:,
          **self_args
        )
      end
    end
  end
end
