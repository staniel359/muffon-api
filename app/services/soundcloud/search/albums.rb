module SoundCloud
  module Search
    class Albums < SoundCloud::Search::Base
      COLLECTION_NAME = 'albums'.freeze

      private

      def collection_item_data_formatted(album)
        SoundCloud::Search::Albums::Album.call(
          album: album
        )
      end
    end
  end
end
