module Discogs
  module Search
    class Albums < Discogs::Search::Base
      COLLECTION_NAME = 'albums'.freeze
      COLLECTION_TYPE = 'release'.freeze
      TOTAL_LIMIT = 200

      private

      def collection_item_data_formatted(album)
        Discogs::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
