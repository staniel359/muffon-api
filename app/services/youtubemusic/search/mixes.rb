module YouTubeMusic
  module Search
    class Mixes < YouTubeMusic::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'mixes',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def scope_params
        YouTubeMusic::Utils::Search::ScopeParams.call(
          query: @args[:query],
          scope: 'mixes'
        )
      end

      def collection_item_data_formatted(
        raw_playlist_data
      )
        YouTubeMusic::Search::Playlists::Playlist.call(
          raw_playlist_data:,
          **self_args
        )
      end
    end
  end
end
