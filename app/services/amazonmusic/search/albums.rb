module AmazonMusic
  module Search
    class Albums < AmazonMusic::Search::Base
      COLLECTION_NAME = 'albums'.freeze

      private

      def link
        "#{BASE_LINK}/searchCatalogAlbums"
      end

      def collection_item_data_formatted(album)
        AmazonMusic::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
