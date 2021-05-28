module Spotify
  module Artist
    class Albums < Spotify::Artist::Base
      COLLECTION_NAME = 'albums'.freeze
      include Spotify::Utils::Pagination

      private

      def no_data?
        collection_list.blank?
      end

      def collection_list
        @collection_list ||= response_data['items']
      end

      def link
        "#{super}/albums"
      end

      def total_items_count
        response_data['total']
      end

      def collection_item_data_formatted(album)
        Spotify::Artist::Albums::Album.call(
          album: album
        )
      end

      alias artist_data paginated_data
    end
  end
end
