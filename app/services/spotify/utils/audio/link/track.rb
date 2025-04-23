module Spotify
  module Utils
    module Audio
      class Link
        class Track < Spotify::Utils::Audio::Link
          private

          def primary_args
            [@args[:track_id]]
          end

          def no_data?
            false
          end

          def link
            "#{BASE_LINK}/metadata/4/track/#{global_id}"
          end

          def global_id
            Base62
              .decode(track_id)
              .to_s(16)
              .rjust(32, '0')
          end

          alias data response_data
        end
      end
    end
  end
end
