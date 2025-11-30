module Spotify
  module Utils
    module Audio
      class Link
        class Key < Spotify::Utils::Audio::Link
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

            `python3.12 lib/spotify/key_retriever.py \
              --pssh #{pssh} \
              --token #{spotify_token} \
              --client-token #{client_token}`
          end

          def test_key
            'e9730e75426d748290f56f1f94074efc'
          end

          def pssh
            response_data['pssh']
          end

          def link
            "https://seektables.scdn.co/seektable/#{@args[:file_id]}.json"
          end

          def client_token
            Spotify::Utils::Audio::Link::ClientToken.call
          end
        end
      end
    end
  end
end
