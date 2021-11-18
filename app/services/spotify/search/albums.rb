module Spotify
  module Search
    class Albums < Spotify::Search::Base
      COLLECTION_NAME = 'albums'.freeze
      COLLECTION_TYPE = 'album'.freeze

      private

      def collection_item_data_formatted(album)
        Spotify::Search::Albums::Album.call(
          album: album,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
