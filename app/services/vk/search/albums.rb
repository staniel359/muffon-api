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

      def raw_collection
        super.select do |raw_album_data|
          raw_album_data['main_artists'].present? ||
            raw_album_data['artist'].present?
        end
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
