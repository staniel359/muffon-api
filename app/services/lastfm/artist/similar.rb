module LastFM
  module Artist
    class Similar < LastFM::Kerve::Base
      COLLECTION_NAME = 'similar'.freeze
      TOTAL_LIMIT = 200

      include LastFM::Artist::Utils::Pagination

      private

      def primary_args
        [@args[:artist]]
      end

      def no_data?
        artist.blank?
      end

      def artist
        response_data[
          'results'
        ]
      end

      def params
        {
          artist: @args[:artist],
          limit: TOTAL_LIMIT
        }
      end

      def data
        { artist: artist_data }
      end

      def name
        artist.dig(
          'main_artist', 'artist'
        )
      end

      def raw_collection_list
        artist['artist']
      end

      def total_items_count
        @total_items_count ||=
          raw_collection_list.size
      end

      def collection_item_data_formatted(artist)
        LastFM::Artist::Similar::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          minimal: @args[:minimal]
        )
      end

      alias link similar_artists_link
    end
  end
end
