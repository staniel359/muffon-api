module VK
  module Search
    class Artists < VK::Search::Base
      API_METHOD = 'audio.searchArtists'.freeze

      private

      def search_data
        paginated_data(
          collection_name: 'artists',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def collection_item_data_formatted(artist)
        VK::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
