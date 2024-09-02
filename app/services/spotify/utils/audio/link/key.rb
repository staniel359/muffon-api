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
            seektables_data.blank?
          end

          def seektables_data
            @seektables_data ||=
              Spotify::Utils::Audio::Link::Seektables.call(
                file_id:
              )
          end

          def data
            return test_key if test?

            `python3.10 lib/spotify/key_retriever.py \
              --pssh #{pssh} \
              --token #{spotify_token}`
          end

          def test_key
            '75a2ec7276c0c332cd9c03e970d2d984'
          end

          def pssh
            seektables_data['pssh']
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
