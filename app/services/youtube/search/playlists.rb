module YouTube
  module Search
    class Playlists < YouTube::Search::Base
      COLLECTION_NAME = 'playlists'.freeze
      MODEL_NAME = 'playlist'.freeze

      private

      def collection_list
        super.reject do |collection_item|
          channel_item?(
            collection_item
          )
        end
      end

      def collection_item_data_formatted(playlist)
        YouTube::Search::Playlists::Playlist.call(
          playlist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
