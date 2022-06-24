module LastFM
  module Artist
    class Similar < LastFM::Artist::Base
      API_METHOD = 'artist.getSimilar'.freeze
      COLLECTION_NAME = 'similar'.freeze
      TOTAL_LIMIT = 250
      LIMIT = 250
      include LastFM::Artist::Utils::Pagination

      private

      def artist
        response_data[
          'similarartists'
        ]
      end

      def collection_list
        return random_item if @args[:random]

        super
      end

      def raw_collection_list
        artist['artist']
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
