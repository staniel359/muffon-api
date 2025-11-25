module AmazonMusic
  module Artist
    class Albums < AmazonMusic::Artist::Base
      private

      def artist_data
        {
          **super,
          **albums_data
        }
      end

      def albums_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def raw_collection
        response_data.dig(
          'methods',
          0,
          'template',
          'widgets',
          0,
          'items'
        ) ||
          response_data.dig(
            'methods',
            0,
            'items'
          )
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
