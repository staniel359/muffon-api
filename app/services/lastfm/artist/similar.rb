module LastFM
  module Artist
    class Similar < LastFM::Artist::Base
      API_METHOD = 'artist.getSimilar'.freeze
      COLLECTION_NAME = 'similar'.freeze
      TOTAL_LIMIT = 250
      include LastFM::Artist::Utils::Pagination

      private

      def artist
        response_data[
          'similarartists'
        ]
      end

      def raw_collection_list
        return random_artist if @args[:random]

        similar_artists_list
      end

      def random_artist
        [
          similar_artists_list[
            0...limit
          ].sample
        ]
      end

      def similar_artists_list
        artist['artist']
      end

      def total_items_count
        raw_collection_list.size
      end

      def collection_item_data_formatted(artist)
        LastFM::Artist::Similar::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          minimal: @args[:minimal]
        )
      end
    end
  end
end
