module AmazonMusic
  module Artist
    class Albums < AmazonMusic::Artist::Base
      COLLECTION_NAME = 'albums'.freeze

      include AmazonMusic::Utils::Pagination

      private

      def no_data?
        artist_info_data.blank?
      end

      def artist_info_data
        @artist_info_data ||=
          AmazonMusic::Artist::Info.call(
            artist_id:
          )[:artist]
      end

      def link
        "#{BASE_LINK}/showCatalogMusicItems/" \
          'uri%3A_SLASH__SLASH_artist_SLASH_' \
          "#{artist_id}_SLASH_chronological-albums"
      end

      def payload
        AmazonMusic::Utils::Request::Payload.call(
          page: @args[:page]
        )
      end

      def artist_data
        super.merge(
          paginated_data
        )
      end

      def name
        artist_info_data[:name]
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
