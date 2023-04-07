module YouTubeMusic
  module Search
    class Playlists < YouTubeMusic::Search::Base
      COLLECTION_NAME = 'playlists'.freeze
      SCOPE = 'playlists'.freeze

      private

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
