module Deezer
  module Search
    class Albums < Deezer::Search::Base
      COLLECTION_NAME = 'albums'.freeze
      MODEL_NAME = 'album'.freeze
      TOTAL_LIMIT = 200

      private

      def collection_item_data_formatted(album)
        Deezer::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
