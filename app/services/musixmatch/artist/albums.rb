module MusixMatch
  module Artist
    class Albums < MusixMatch::Artist::Base
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
          items_count:
        )
      end

      def raw_collection
        response_data.dig(
          'message',
          'body',
          'album_list'
        )
      end

      def link
        "#{BASE_LINK}/artist.albums.get"
      end

      def params
        {
          **super,
          s_release_date: 'desc',
          g_album_name: 1,
          page:,
          page_size: limit
        }
      end

      def items_count
        response_data.dig(
          'message',
          'header',
          'available'
        ) || 0
      end

      def collection_item_data_formatted(album)
        MusixMatch::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
