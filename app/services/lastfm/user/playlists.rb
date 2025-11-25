module LastFM
  module User
    class Playlists < LastFM::User::Web::Base
      private

      def user_data
        {
          **user_base_data,
          **playlists_data
        }
      end

      def playlists_data
        paginated_data(
          collection_name: 'playlists',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true,
          is_with_items_count: true
        )
      end

      def raw_collection
        response_data.css(
          '.playlisting-playlists-item'
        )
      end

      def link
        "#{base_link}/playlists"
      end

      def collection_item_data_formatted(playlist)
        LastFM::User::Playlists::Playlist.call(
          playlist:,
          nickname: lastfm_nickname,
          skip_profile: true,
          with_tracks: @args[:with_tracks]
        )
      end
    end
  end
end
