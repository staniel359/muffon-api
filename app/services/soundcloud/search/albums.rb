module SoundCloud
  module Search
    class Albums < SoundCloud::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count:
        )
      end

      def link
        "#{BASE_LINK}/search/albums"
      end

      def collection_item_data_formatted(album)
        SoundCloud::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
