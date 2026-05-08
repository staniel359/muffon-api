module Spotify
  module User
    module Playlist
      class Base < Spotify::User::Base
        private

        def required_args
          [
            *super,
            :playlist_id
          ]
        end

        def request_url
          "#{REQUEST_BASE_URL}/playlists/#{@args[:playlist_id]}"
        end

        def user_data
          { playlist: playlist_data }
        end

        alias raw_playlist_data response_data
      end
    end
  end
end
