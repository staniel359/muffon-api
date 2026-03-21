module Spotify
  module Playlist
    class Base < Spotify::Base
      def call
        raise forbidden_error unless test?

        check_args

        check_if_not_found

        data
      rescue Faraday::UnauthorizedError
        if spotify_connection.present?
          retry_with_new_session
        else
          retry_with_new_spotify_token
        end
      end

      private

      def required_args
        %i[
          playlist_id
        ]
      end

      def not_found?
        raw_playlist_data['__typename'] == 'GenericError'
      end

      def raw_playlist_data
        response_data.dig(
          'data',
          'playlistV2'
        )
      end

      def payload
        {
          'variables' => {
            'uri' => spotify_uri,
            'offset' => 0,
            'limit' => 0,
            'enableWatchFeedEntrypoint' => true
          },
          'operationName' => 'fetchPlaylist',
          'extensions' => {
            'persistedQuery' => {
              'version' => 1,
              'sha256Hash' => '346811f856fb0b7e4f6c59f8ebea78dd081c6e2fb01b77c954b26259d5fc6763' # rubocop:disable Layout/LineLength
            }
          }
        }.to_json
      end

      def spotify_uri
        "spotify:playlist:#{@args[:playlist_id]}"
      end

      def spotify_token
        spotify_connection&.access_token || super
      end

      def data
        { playlist: playlist_data }
      end

      alias response post_response
    end
  end
end
