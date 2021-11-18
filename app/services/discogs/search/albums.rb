module Discogs
  module Search
    class Albums < Discogs::Search::Base
      COLLECTION_NAME = 'albums'.freeze
      COLLECTION_TYPE = 'release'.freeze

      private

      def collection_item_data_formatted(album)
        Discogs::Search::Albums::Album.call(
          album: album,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
