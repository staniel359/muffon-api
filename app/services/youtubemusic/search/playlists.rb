module YouTubeMusic
  module Search
    class Playlists < YouTubeMusic::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'playlists',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def scope_params
        YouTubeMusic::Search::ScopeParams.call(
          query: @args[:query],
          scope: 'playlists'
        )
      end

      def collection_item_data_formatted(playlist)
        YouTubeMusic::Search::Playlists::Playlist.call(
          playlist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
