module VK
  module Search
    class Albums < VK::Search::Base
      API_METHOD = 'audio.searchAlbums'.freeze

      private

      def search_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def collection_item_data_formatted(album)
        VK::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
