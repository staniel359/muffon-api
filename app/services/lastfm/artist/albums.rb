module LastFM
  module Artist
    class Albums < LastFM::Artist::Base
      API_METHOD = 'artist.getTopAlbums'.freeze
      COLLECTION_NAME = 'albums'.freeze
      TOTAL_LIMIT = 300
      LIMIT = 200
      include LastFM::Utils::Pagination

      private

      def no_data?
        super || albums_list.blank?
      end

      def artist
        @artist ||= response_data['topalbums']
      end

      def total_limit
        TOTAL_LIMIT
      end

      def albums_list
        @albums_list ||= artist['album']
      end

      def total_items_count
        [albums_list.size, LIMIT].min
      end

      def collection_list
        collection_paginated(
          albums_list_filtered
        )
      end

      def albums_list_filtered
        albums_list.reject do |a|
          a['name'] == '(null)'
        end
      end

      def collection_item_data_formatted(album)
        LastFM::Artist::Albums::Album.call(
          album: album
        )
      end

      alias artist_data paginated_data
    end
  end
end
