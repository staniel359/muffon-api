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
            seektables_data.blank? # Widevine
            # false # PlayPlay
          end

          def seektables_data
            @seektables_data ||=
              Spotify::Utils::Audio::Link::Seektables.call(
                file_id:
              )
          end

          def data
            return test_key if test?

            `python3.12 lib/spotify/widevine/key_retriever.py \
              --pssh #{pssh} \
              --token #{spotify_token}` # Widevine

            # `python3.12 lib/spotify/playplay/key_retriever.py \
            #   --file_id #{file_id} \
            #   --token #{spotify_token}` # PlayPlay
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
        end
      end
    end
  end
end
