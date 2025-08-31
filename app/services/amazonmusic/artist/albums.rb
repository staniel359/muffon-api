module AmazonMusic
  module Artist
    class Albums < AmazonMusic::Artist::Base
      COLLECTION_NAME = 'albums'.freeze

      include AmazonMusic::Utils::Pagination

      private

      def artist_data
        {
          **super,
          **paginated_data
        }
      end

      def link
        "#{BASE_LINK}/showCatalogMusicItems/" \
          'uri%3A_SLASH__SLASH_artist_SLASH_' \
          "#{@args[:artist_id]}_SLASH_chronological-albums"
      end

      def payload
        AmazonMusic::Utils::Request::Payload.call(
          page: @args[:page]
        )
      end

      def collection_item_data_formatted(album)
        AmazonMusic::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
