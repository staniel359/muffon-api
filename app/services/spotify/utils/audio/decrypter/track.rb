module Spotify
  module Utils
    module Audio
      class Decrypter
        class Track < Spotify::Utils::Audio::Decrypter
          private

          def primary_args
            [@args[:global_id]]
          end

          def no_data?
            false
          end

          def link
            "#{BASE_LINK}/metadata/4/track/#{global_id}"
          end

          def global_id
            @args[:global_id]
          end

          alias data response_data
        end
      end
    end
  end
end
