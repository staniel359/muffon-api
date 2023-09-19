module MusixMatch
  module Artist
    class Albums < MusixMatch::Artist::Base
      MODEL_NAME = 'album'.freeze
      COLLECTION_NAME = 'albums'.freeze

      include MusixMatch::Utils::Pagination

      private

      def link
        "#{BASE_LINK}/artist.albums.get"
      end

      def params
        super.merge(
          albums_params
        )
      end

      def albums_params
        {
          s_release_date: 'desc',
          g_album_name: 1
        }
      end

      def artist_data
        artist_base_data
          .merge(paginated_data)
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
