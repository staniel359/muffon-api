module Spotify
  module Utils
    module Audio
      class Link
        class Key < Spotify::Utils::Audio::Link
          private

          def primary_args
            [@args[:file_id]]
          end

          def no_data?
            false
          end

          def data
            `python3.10 \
              public/spotify_key_retriever.py \
              --pssh #{pssh} \
              --token #{spotify_token}`
          end

          def pssh
            Spotify::Utils::Audio::Link::Seektables.call(
              file_id:
            )['pssh']
          end

          def file_id
            @args[:file_id]
          end

          def token
            Spotify::Utils::Audio::Link::Token.call
          end
        end
      end
    end
  end
end
