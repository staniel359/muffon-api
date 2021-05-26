module LastFM
  module Search
    class Albums < LastFM::Search::Base
      API_METHOD = 'album.search'.freeze
      COLLECTION_NAME = 'albums'.freeze
      MODEL_NAME = 'album'.freeze

      private

      def collection_item_data_formatted(album)
        LastFM::Search::Albums::Album.call(
          album: album
        )
      end
    end
  end
end
