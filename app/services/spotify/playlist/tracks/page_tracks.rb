module Spotify
  module Playlist
    class Tracks
      class PageTracks < Spotify::Playlist::Tracks
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            playlist_id
            page
            limit
          ]
        end

        def data
          raw_playlist_data.dig(
            'content',
            'items'
          )
        end

        def payload
          {
            'variables' => {
              'uri' => spotify_uri,
              'offset' => offset,
              'limit' => limit
            },
            'operationName' => 'fetchPlaylistContents',
            'extensions' => {
              'persistedQuery' => {
                'version' => 1,
                'sha256Hash' => '346811f856fb0b7e4f6c59f8ebea78dd081c6e2fb01b77c954b26259d5fc6763' # rubocop:disable Layout/LineLength
              }
            }
          }.to_json
        end
      end
    end
  end
end
