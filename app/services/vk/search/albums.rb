module VK
  module Search
    class Albums < VK::Search::Base
      API_METHOD = 'audio.searchAlbums'.freeze
      COLLECTION_NAME = 'albums'.freeze

      private

      def collection_item_data_formatted(album)
        VK::Search::Albums::Album.call(
          album: album,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
