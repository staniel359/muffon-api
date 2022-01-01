module VK
  module Search
    class Artists < VK::Search::Base
      API_METHOD = 'audio.searchArtists'.freeze
      COLLECTION_NAME = 'artists'.freeze

      private

      def collection_item_data_formatted(artist)
        VK::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
