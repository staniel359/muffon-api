module Deezer
  module Search
    class Albums < Deezer::Search::Base
      COLLECTION_NAME = 'albums'.freeze
      MODEL_NAME = 'album'.freeze

      private

      def collection_item_data_formatted(album)
        Deezer::Search::Albums::Album.call(
          album: album
        )
      end
    end
  end
end
