module LastFM
  module Artist
    class Albums < LastFM::Artist::Base
      API_METHOD = 'artist.getTopAlbums'.freeze
      COLLECTION_NAME = 'albums'.freeze
      TOTAL_LIMIT = 500
      LIMIT = 200
      include LastFM::Artist::Utils::Pagination

      private

      def artist
        @artist ||=
          response_data['topalbums']
      end

      def raw_collection_list
        @raw_collection_list ||= artist['album']
      end

      def collection_list
        collection_paginated(
          raw_collection_list_filtered
        )
      end

      def raw_collection_list_filtered
        raw_collection_list.reject do |a|
          a['name'] == '(null)'
        end
      end

      def collection_item_data_formatted(album)
        LastFM::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
