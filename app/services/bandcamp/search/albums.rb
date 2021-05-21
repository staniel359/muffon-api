module Bandcamp
  module Search
    class Albums < Bandcamp::Search::Base
      COLLECTION_NAME = 'albums'.freeze

      private

      def collection_item_data_formatted(album)
        Bandcamp::Search::Albums::Album.call(
          album: album
        )
      end
    end
  end
end
