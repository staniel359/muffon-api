module Genius
  module Search
    class Albums < Genius::Search::Base
      COLLECTION_NAME = 'albums'.freeze
      MODEL_NAME = 'album'.freeze
      TOTAL_LIMIT = 200

      private

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
