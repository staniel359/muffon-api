module Genius
  module Search
    class Albums < Genius::Search::Base
      COLLECTION_NAME = 'albums'.freeze
      MODEL_NAME = 'album'.freeze

      private

      def collection_item_data_formatted(album)
        Genius::Search::Albums::Album.call(
          album: album['result']
        )
      end
    end
  end
end
