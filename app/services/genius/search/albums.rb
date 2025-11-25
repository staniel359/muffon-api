module Genius
  module Search
    class Albums < Genius::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def link
        "#{BASE_LINK}/search/album"
      end

      def collection_item_data_formatted(album)
        Genius::Search::Albums::Album.call(
          album: album['result'],
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
