module Spotify
  module Utils
    module Track
      module Audio
        class Link
          class Key < Spotify::Base
            def call
              check_args

              data
            end

            private

            def required_args
              %i[
                file_id
              ]
            end

            def data
              return test_key if test?

              `python3.12 \
                lib/spotify/key_retriever.py \
                --pssh '#{pssh}' \
                --token '#{spotify_audio_token}' \
                --client_token '#{spotify_client_token}' \
                --user_agent '#{REQUEST_USER_AGENT}'`
            end

            def test_key
              'e9730e75426d748290f56f1f94074efc'
            end

            def pssh
              response_data.dig(
                'pssh',
                'widevine'
              )
            end

            def response_data
              Muffon::Request.call(
                url: request_url,
                method: 'GET',
                headers: request_headers
              )
            end

            def request_url
              "https://seektables.spotifycdn.com/v1/seektable/#{@args[:file_id]}"
            end
          end
        end
      end
    end
  end
end
