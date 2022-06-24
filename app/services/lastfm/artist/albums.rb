module LastFM
  module Artist
    class Albums < LastFM::Artist::Base
      API_METHOD = 'artist.getTopAlbums'.freeze
      COLLECTION_NAME = 'albums'.freeze
      TOTAL_LIMIT = 200
      include LastFM::Artist::Utils::Pagination

      private

      def artist
        response_data['topalbums']
      end

      def collection_list
        collection_list_filtered.last(limit)
      end

      def collection_list_filtered
        artist['album'].reject do |a|
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
