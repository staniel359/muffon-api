module VK
  module Search
    class Artists < VK::Search::Base
      API_METHOD = 'audio.searchArtists'.freeze
      COLLECTION_NAME = 'artists'.freeze

      private

      def collection_item_data_formatted(artist)
        VK::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      def collection_count
        if super < limit
          super
        else
          total_limit
        end
      end
    end
  end
end
