module LastFM
  module Artist
    class Similar < LastFM::Artist::Base
      API_METHOD = 'artist.getSimilar'.freeze
      COLLECTION_NAME = 'similar'.freeze
      include LastFM::Artist::Utils::Pagination

      private

      def artist
        @artist ||= response_data['similarartists']
      end

      def raw_collection_list
        @raw_collection_list ||= artist['artist']
      end

      def total_items_count
        raw_collection_list.size
      end

      def collection_item_data_formatted(artist)
        LastFM::Artist::Similar::Artist.call(
          artist: artist
        )
      end
    end
  end
end
